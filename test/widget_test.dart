import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:attendease_frontend/app.dart';

void main() {
  testWidgets('App boot smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: AttendEaseApp()));
    await tester.pumpAndSettle();

    expect(find.text('AttendEase'), findsOneWidget);
  });
}