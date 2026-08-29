import 'package:education_app/src/course/presentation/pages/all_courses_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AllCoursesView displays search tooltip on IconButton',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AllCoursesView(courses: []),
      ),
    );

    final searchIconButton = find.byTooltip('Search');
    expect(searchIconButton, findsOneWidget);
  });
}
