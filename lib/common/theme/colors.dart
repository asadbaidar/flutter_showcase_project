part of 'theme.dart';

abstract class AppColors {
  const AppColors();

  Brightness get brightness;

  Color get primary;
  Color get secondary;
  Color get tertiary;
  Color get error;
  Color get shadow;
  Color get neutral;

  Color get neutral_0;
  Color get neutral_20;
  Color get neutral_40;
  Color get neutral_60;
  Color get neutral_80;
  Color get neutral_100;

  ColorScheme get colorScheme => ColorScheme(
        brightness: brightness,
        primary: primary,
        onPrimary: neutral,
        secondary: secondary,
        onSecondary: neutral,
        tertiary: tertiary,
        onTertiary: neutral,
        error: error,
        onError: neutral,
        background: neutral,
        onBackground: neutral_80,
        surface: neutral_0,
        onSurface: neutral_80,
        surfaceVariant: neutral_20,
        onSurfaceVariant: neutral_60,
        outline: neutral_20,
        outlineVariant: neutral_40,
        shadow: shadow,
      );
}

class LightAppColors extends AppColors {
  const LightAppColors._();
  factory LightAppColors() => instance;
  static const instance = LightAppColors._();

  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get primary => const Color(0xFF5B5EA6);

  @override
  Color get secondary => const Color(0xFF263D36);

  @override
  Color get tertiary => const Color(0xFF79536A);

  @override
  Color get error => const Color(0xFFBA1A1A);

  @override
  Color get shadow => Colors.black.withOpacity(0.6);

  @override
  Color get neutral => const Color(0xFFFFFFFF);

  @override
  Color get neutral_0 => const Color(0xFFF8FBF9);

  @override
  Color get neutral_20 => const Color(0xFFD9E5E2);

  @override
  Color get neutral_40 => const Color(0xFF9AABA6);

  @override
  Color get neutral_60 => const Color(0xFF878C8A);

  @override
  Color get neutral_80 => const Color(0xFF181A19);

  @override
  Color get neutral_100 => const Color(0xFF000000);
}

class DarkAppColors extends AppColors {
  const DarkAppColors._();
  factory DarkAppColors() => instance;
  static const instance = DarkAppColors._();

  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get primary => const Color(0xFFC0C1FF);

  @override
  Color get secondary => const Color(0xFF5DDBBC);

  @override
  Color get tertiary => const Color(0xFFE8B9D4);

  @override
  Color get error => const Color(0xFFFFB4AB);

  @override
  Color get shadow => Colors.black;

  @override
  Color get neutral => const Color(0xFF000000);

  @override
  Color get neutral_0 => const Color(0xFF181A19);

  @override
  Color get neutral_20 => const Color(0xFF2D2F2E);

  @override
  Color get neutral_40 => const Color(0xFF7F8783);

  @override
  Color get neutral_60 => const Color(0xFFA5AFAA);

  @override
  Color get neutral_80 => const Color(0xFFEEF7F3);

  @override
  Color get neutral_100 => const Color(0xFFFFFFFF);
}

extension ColorSchemeContext on BuildContext {
  Color get primary => colorScheme.primary;

  Color get onPrimary => colorScheme.onPrimary;

  Color get secondary => colorScheme.secondary;

  Color get onSecondary => colorScheme.onSecondary;

  Color get tertiary => colorScheme.tertiary;

  Color get onTertiary => colorScheme.onTertiary;

  Color get error => colorScheme.error;

  Color get onError => colorScheme.onError;

  Color get background => colorScheme.background;

  Color get onBackground => colorScheme.onBackground;

  Color get surface => colorScheme.surface;

  Color get onSurface => colorScheme.onSurface;

  Color get surfaceVariant => colorScheme.surfaceVariant;

  Color get onSurfaceVariant => colorScheme.onSurfaceVariant;

  Color get outline => colorScheme.outline;

  Color get shadow => colorScheme.shadow;

  Color get scrim => colorScheme.scrim;

  Color get hint => colorScheme.outlineVariant;
}

extension TextStyleColor on TextStyle {
  TextStyle withColor(Color? color) => copyWithGoogleFont(color: color);

  TextStyle primary(BuildContext context) => withColor(context.primary);

  TextStyle onPrimary(BuildContext context) => withColor(context.onPrimary);

  TextStyle secondary(BuildContext context) => withColor(context.secondary);

  TextStyle onSecondary(BuildContext context) => withColor(context.onSecondary);

  TextStyle tertiary(BuildContext context) => withColor(context.tertiary);

  TextStyle onTertiary(BuildContext context) => withColor(context.onTertiary);

  TextStyle error(BuildContext context) => withColor(context.error);

  TextStyle onError(BuildContext context) => withColor(context.onError);

  TextStyle background(BuildContext context) => withColor(context.onBackground);

  TextStyle onBackground(BuildContext context) =>
      withColor(context.onBackground);

  TextStyle surface(BuildContext context) => withColor(context.surface);

  TextStyle onSurface(BuildContext context) => withColor(context.onSurface);

  TextStyle surfaceVariant(BuildContext context) =>
      withColor(context.surfaceVariant);

  TextStyle onSurfaceVariant(BuildContext context) =>
      withColor(context.onSurfaceVariant);

  TextStyle hint(BuildContext context) => withColor(context.hint);
}
