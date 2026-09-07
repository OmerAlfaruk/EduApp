import 'package:education_app/core/common/views/nested_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('NestedBackButton has accessibility tooltip',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: NestedBackButton(),
          ),
        ),
      ),
    );

    final iconButtonFinder = find.byType(IconButton);
    expect(iconButtonFinder, findsOneWidget);

    final IconButton iconButton = tester.widget(iconButtonFinder);
    expect(iconButton.tooltip, 'Back');
  });
}
