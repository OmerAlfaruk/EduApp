import 'package:education_app/core/common/views/nested_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('NestedBackButton smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: NestedBackButton(),
        ),
      ),
    );

    expect(find.byType(NestedBackButton), findsOneWidget);
    expect(find.byTooltip('Back'), findsOneWidget);
  });
}
