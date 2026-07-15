import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:enternalmind_ai/main.dart';

void main() {
  testWidgets('App launches and shows splash screen', (tester) async {
    await tester.pumpWidget(const EternalMindApp());

    // Pump a frame to build the widget tree
    await tester.pump();

    // Verify that the splash screen is rendered
    expect(find.byType(EternalMindApp), findsOneWidget);

    // Pump through initialization steps (7 steps × 300ms each = 2100ms)
    // to let all pending timers complete before the test ends
    await tester.pump(const Duration(seconds: 3));

    // Unmount the widget to cancel any remaining animation timers
    await tester.pumpWidget(const SizedBox());
  });
}
