import 'package:education_app/core/common/views/nested_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('NestedBackButton renders correctly with Back tooltip', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: NestedBackButton(),
        ),
      ),
    );

    // Verify IconButton is present
    expect(find.byType(IconButton), findsOneWidget);

    // Verify IconButton has the tooltip 'Back'
    final iconButtonFinder = find.byType(IconButton);
    final IconButton iconButton = tester.widget(iconButtonFinder);
    expect(iconButton.tooltip, 'Back');

    // Also verify finding by tooltip works
    expect(find.byTooltip('Back'), findsOneWidget);
  });
}
