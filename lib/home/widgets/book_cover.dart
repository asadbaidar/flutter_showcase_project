part of 'widgets.dart';

class BookCover extends StatelessWidget {
  const BookCover.large({
    super.key,
    this.image,
    this.borderRadius = 10,
    this.size = const Size(75, 100),
  });

  const BookCover.small({
    super.key,
    this.image,
    this.borderRadius = 10,
    this.size = const Size(53.6, 80),
  });

  const BookCover.circle({
    super.key,
    this.image,
    this.borderRadius,
    this.size = const Size.square(100),
  });

  final String? image;
  final double? borderRadius;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Ink(
        decoration: BoxDecoration(
          color: context.surfaceVariant,
          borderRadius: BorderRadius.circular(borderRadius ?? size.height),
          image: image == null
              ? null
              : DecorationImage(
                  image: NetworkImage(image!),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
