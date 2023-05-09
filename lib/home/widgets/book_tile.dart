part of 'widgets.dart';

class BookGridTile extends StatelessWidget {
  const BookGridTile({
    super.key,
    this.title,
    this.author,
    this.cover,
    this.onTap,
  });

  final String? title;
  final String? author;
  final String? cover;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 12),
        child: SizedBox(
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookCover.circle(image: cover),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 3),
                child: CustomListTile(
                  title: title,
                  subtitle: author,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookListTile extends StatelessWidget {
  const BookListTile({
    super.key,
    this.title,
    this.author,
    this.date,
    this.leading,
    this.trailing,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.leadingPadding = const EdgeInsetsDirectional.only(end: 12),
    this.onTap,
  });

  final String? title;
  final String? author;
  final String? date;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry leadingPadding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Row(
          children: [
            if (leading != null)
              Padding(
                padding: leadingPadding,
                child: leading,
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomListTile(
                    title: title,
                    subtitle: author,
                  ),
                  if (date != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: Row(
                        children: [
                          AssetIcon(
                            AssetIcons.calendar,
                            color: context.secondary,
                            size: 16,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            date!,
                            style: context.bodySmall?.secondary(context),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            if (trailing != null)
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 12),
                child: trailing,
              ),
          ],
        ),
      ),
    );
  }
}
