import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tapped_test_project/common/common.dart';

class CustomHorizontalListView extends StatelessWidget {
  const CustomHorizontalListView({
    super.key,
    required this.itemBuilder,
    this.itemCount = 0,
    this.section,
    this.edgeDivider = const SizedBox(width: 9),
    this.height = 170,
  });

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final Widget? section;
  final Widget? edgeDivider;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (section != null) section!,
        SizedBox(
          height: height,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return edgeDivider != null
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (index == 0) edgeDivider!,
                        itemBuilder(context, index),
                        if (index == itemCount - 1) edgeDivider!,
                      ],
                    )
                  : itemBuilder(context, index);
            },
          ),
        ),
      ],
    );
  }
}

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    this.headerBuilder,
    required this.itemBuilder,
    this.itemCount = 0,
    this.section,
    this.divider = const Divider(),
  });

  final WidgetBuilder? headerBuilder;
  final NullableIndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final Widget? section;
  final Widget? divider;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount + 1,
      separatorBuilder: (context, index) {
        if (index == 0) {
          return section ?? const SizedBox.shrink();
        }

        return divider ?? const SizedBox.shrink();
      },
      itemBuilder: (context, index) {
        if (index == 0) {
          return headerBuilder?.call(context) ?? const SizedBox.shrink();
        }

        return itemBuilder(context, index - 1);
      },
    );
  }
}

class CustomSection extends StatelessWidget {
  const CustomSection({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        text,
        style: context.headlineMedium?.primary(context),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.title,
    this.subtitle,
  });

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          Text(
            title!,
            style: context.headlineSmall,
            overflow: TextOverflow.ellipsis,
          ),
        if (title != null && subtitle != null) const SizedBox(height: 2),
        if (subtitle != null)
          Text(
            subtitle!,
            style: context.bodyMedium?.onSurfaceVariant(context),
            overflow: TextOverflow.ellipsis,
          ),
      ],
    );
  }
}

class CustomProgress extends StatelessWidget {
  const CustomProgress({
    super.key,
    this.size = 24.0,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: size,
        child: context.platform == TargetPlatform.iOS
            ? CupertinoActivityIndicator(
                radius: size / 2,
                color: context.primary,
              )
            : CircularProgressIndicator(strokeWidth: size * 0.09),
      ),
    );
  }
}

class CustomError extends StatelessWidget {
  const CustomError({
    super.key,
    this.message,
    this.emptyMessage,
    this.isFailure = false,
    this.onRetry,
  });

  final String? message;
  final String? emptyMessage;
  final bool isFailure;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomListTile(
            subtitle: isFailure ? message : emptyMessage ?? 'No data available',
          ),
          if (onRetry != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: CustomInkWell(
                onTap: onRetry,
                borderRadius: 6,
                borderWidth: 1,
                borderColor: context.primary,
                splashColor: context.primary.withOpacity(0.2),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 6,
                ),
                child: Text(
                  'Retry',
                  style: context.bodyMedium?.primary(context),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
