import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tapped_test_project/app/app.dart';

void main() {
  testWidgets('App renders', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
