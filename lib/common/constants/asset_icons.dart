// ignore_for_file: constant_identifier_names

enum AssetIcons {
  bell,
  calendar,
  compass,
  home,
  notification,
  play,
  search,
  stack,
}

extension AssetIconsX on AssetIcons {
  static const String _basePath = 'assets/icons';

  String get svg => '$_basePath/$name.svg';
}
