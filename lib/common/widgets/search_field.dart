import 'package:flutter/material.dart';
import 'package:tapped_test_project/common/common.dart';

const _kOptionHeight = 104.0;
const _kVisibleOptionCount = 3;
const _kOptionsOffset = Offset(0.0, 4.0);

class CustomSearchField<T extends Object> extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.options,
    required this.optionViewBuilder,
    this.onSelected,
    this.onChanged,
    this.divider,
    this.optionHeight = _kOptionHeight,
    this.visibleOptionCount = _kVisibleOptionCount,
    this.margin,
    this.optionsOffset = _kOptionsOffset,
    this.focusNode,
    this.controller,
    this.initialValue,
    this.hintText,
  });

  final AutocompleteOptions<T> options;
  final AutocompleteOptionViewBuilder<T> optionViewBuilder;
  final AutocompleteOnSelected<T>? onSelected;
  final ValueChanged<String>? onChanged;
  final Widget? divider;
  final double optionHeight;
  final int visibleOptionCount;
  final EdgeInsetsGeometry? margin;
  final Offset optionsOffset;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextEditingValue? initialValue;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return SmartAutocomplete<T>(
      optionFilter: null,
      options: options,
      onSelected: onSelected,
      optionViewBuilder: optionViewBuilder,
      divider: divider,
      optionHeight: optionHeight,
      visibleOptionCount: visibleOptionCount,
      margin: margin,
      optionsOffset: optionsOffset,
      focusNode: focusNode,
      controller: controller,
      initialValue: initialValue,
      fieldViewBuilder: _buildFieldView,
      onFieldChanged: onChanged,
    );
  }

  Widget _buildFieldView(
    BuildContext context,
    TextEditingController controller,
    FocusNode focusNode,
    VoidCallback onFieldSubmitted,
  ) {
    return CustomSearchTextField(
      controller: controller,
      hintText: hintText,
      focusNode: focusNode,
      onFieldSubmitted: (_) => onFieldSubmitted(),
    );
  }
}

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    this.controller,
    this.hintText,
    this.focusNode,
    this.onChanged,
    this.onFieldSubmitted,
  });

  final TextEditingController? controller;
  final String? hintText;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      style: context.bodyLarge,
      textInputAction: TextInputAction.search,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: context.bodyLarge?.hint(context),
        border: InputBorder.none,
        suffixIcon: AssetIcon(
          AssetIcons.search,
          color: context.hint,
          size: 16,
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 42,
          minHeight: 16,
        ),
        contentPadding: const EdgeInsetsDirectional.only(start: 26),
      ),
    );
  }
}
