// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hostelmate/screens/student/login_screen.dart';

void main() {
  testWidgets('Student Login Screen Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: StudentLoginScreen()));

    // Verify that the 'Student Login' text is present.
    expect(find.text('Student Login'), findsOneWidget);
  });
}
