import 'package:education_app/core/common/views/nested_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('NestedBackButton has "Back" tooltip for accessibility',
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

    expect(find.byTooltip('Back'), findsOneWidget);
    final iconButton = tester.widget<IconButton>(find.byType(IconButton));
    expect(iconButton.tooltip, equals('Back'));
  });
}
