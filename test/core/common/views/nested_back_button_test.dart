import 'package:education_app/core/common/views/nested_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('NestedBackButton renders IconButton with Back tooltip', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: NestedBackButton(),
          ),
        ),
      ),
    );

    final iconButton = tester.widget<IconButton>(find.byType(IconButton));
    expect(iconButton.tooltip, equals('Back'));
  });
}
