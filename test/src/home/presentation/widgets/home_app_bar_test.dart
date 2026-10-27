import 'package:education_app/core/common/app/providers/user_provider.dart';
import 'package:education_app/src/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('HomeAppBar renders search and notifications tooltips',
      (WidgetTester tester) async {
    final userProvider = UserProvider();

    await tester.pumpWidget(
      ChangeNotifierProvider<UserProvider>.value(
        value: userProvider,
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

    final notificationIconButton = tester.widget<IconButton>(
      find.widgetWithIcon(IconButton, Icons.notifications),
    );
    expect(notificationIconButton.tooltip, 'Notifications');
  });
}
