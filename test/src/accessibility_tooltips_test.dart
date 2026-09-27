import 'package:education_app/core/common/app/providers/user_provider.dart';
import 'package:education_app/core/common/views/nested_back_button.dart';
import 'package:education_app/src/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  group('Accessibility & UX Tooltip Tests', () {
    testWidgets('NestedBackButton has tooltip "Back"', (WidgetTester tester) async {
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
      expect(iconButton.tooltip, 'Back');
    });

    testWidgets('HomeAppBar has tooltips for Search and Notifications', (WidgetTester tester) async {
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

      final searchIconButton = tester.widget<IconButton>(
        find.widgetWithIcon(IconButton, Icons.search),
      );
      expect(searchIconButton.tooltip, 'Search');

      final notificationsIconButton = tester.widget<IconButton>(
        find.widgetWithIcon(IconButton, Icons.notifications),
      );
      expect(notificationsIconButton.tooltip, 'Notifications');
    });
  });
}
