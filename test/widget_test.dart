// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_template/main.dart';

void main() {
  testWidgets('WordPair generation test', (WidgetTester tester) async {
    // Build our app with ProviderScope and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        child: MyApp(),
      ),
    );

    // Verify that the initial WordPair is displayed.
    expect(find.byType(Text), findsOneWidget);

    // Tap the 'Next' button and trigger a frame.
    await tester.tap(find.text('Next'));
    await tester.pump();

    // Verify that a new WordPair is displayed.
    expect(find.byType(Text), findsOneWidget);
  });

  testWidgets('Toggle Favorite test', (WidgetTester tester) async {
    // Build our app with ProviderScope and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        child: MyApp(),
      ),
    );

    // Tap the 'Toggle Favorite' button and trigger a frame.
    await tester.tap(find.text('Toggle Favorite'));
    await tester.pump();

    // Verify that the favorite state is toggled.
    expect(find.text('Toggle Favorite'), findsOneWidget);
  });
}