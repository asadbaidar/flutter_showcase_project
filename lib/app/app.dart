import 'package:flutter/material.dart';
import 'package:tapped_test_project/common/theme/theme.dart';
import 'package:tapped_test_project/common/utils/utils.dart';
import 'package:tapped_test_project/tab/view/view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.unfocus(),
      child: MaterialApp(
        title: 'Storyways',
        theme: AppTheme().lightTheme,
        darkTheme: AppTheme().darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const TabPage(),
      ),
    );
  }
}
