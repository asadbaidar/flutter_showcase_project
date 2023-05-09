part of 'view.dart';

class TabView extends StatelessWidget {
  const TabView({
    super.key,
    this.defaultTab = TabItem.home,
  });

  final TabItem defaultTab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _TabBody(currentTab: defaultTab),
      bottomNavigationBar: _BottomNavBar(currentTab: defaultTab),
    );
  }
}

class _TabBody extends StatelessWidget {
  const _TabBody({required this.currentTab});

  final TabItem currentTab;

  @override
  Widget build(BuildContext context) {
    switch (currentTab) {
      case TabItem.home:
        return const HomePage();
      default:
        return const Center(child: Text('Not implemented'));
    }
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({required this.currentTab});

  final TabItem currentTab;

  @override
  Widget build(BuildContext context) {
    return CustomBottomNavBar(
      children: TabItem.items.map((tab) {
        return CustomBottomNavItem(
          icon: AssetIcon(tab.icon),
          label: tab.title,
          isSelected: tab == currentTab,
          onTap: () => context.unfocus(),
        );
      }).toList(),
    );
  }
}
