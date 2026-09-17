import 'package:education_app/core/common/app/providers/user_provider.dart';
import 'package:education_app/core/common/views/nested_back_button.dart';
import 'package:education_app/src/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('NestedBackButton renders IconButton with tooltip "Back"',
      (WidgetTester tester) async {
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

    final iconButtonFinder = find.byType(IconButton);
    expect(iconButtonFinder, findsOneWidget);

    final iconButton = tester.widget<IconButton>(iconButtonFinder);
    expect(iconButton.tooltip, 'Back');
  });

  testWidgets('HomeAppBar renders IconButtons with proper tooltips',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => UserProvider(),
        child: const MaterialApp(
          home: Scaffold(
            appBar: HomeAppBar(),
          ),
        ),
      ),
    );

    final searchButtonFinder = find.widgetWithIcon(IconButton, Icons.search);
    expect(searchButtonFinder, findsOneWidget);
    final searchButton = tester.widget<IconButton>(searchButtonFinder);
    expect(searchButton.tooltip, 'Search');

    final notificationButtonFinder =
        find.widgetWithIcon(IconButton, Icons.notifications);
    expect(notificationButtonFinder, findsOneWidget);
    final notificationButton =
        tester.widget<IconButton>(notificationButtonFinder);
    expect(notificationButton.tooltip, 'Notifications');
  });
}
