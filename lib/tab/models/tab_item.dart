part of 'models.dart';

enum TabItem {
  home(AssetIcons.home),
  collection(AssetIcons.stack),
  discover(AssetIcons.compass),
  notification(AssetIcons.notification),
  ;

  const TabItem(this.icon);
  final AssetIcons icon;

  String get title {
    switch (this) {
      case TabItem.home:
        return 'Home';
      case TabItem.collection:
        return 'Collection';
      case TabItem.discover:
        return 'Discover';
      case TabItem.notification:
        return 'Notification';
    }
  }

  static List<TabItem> get items => values;
}
