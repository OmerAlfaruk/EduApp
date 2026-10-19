import 'package:education_app/core/common/app/providers/user_provider.dart';
import 'package:education_app/core/common/views/nested_back_button.dart';
import 'package:education_app/src/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('NestedBackButton renders IconButton with Back tooltip', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: const NestedBackButton(),
          ),
        ),
      ),
    );

    final backButtonFinder = find.byType(IconButton);
    expect(backButtonFinder, findsOneWidget);

    final iconButton = tester.widget<IconButton>(backButtonFinder);
    expect(iconButton.tooltip, equals('Back'));
  });

  testWidgets('HomeAppBar renders Search and Notifications tooltips', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: const Scaffold(
            appBar: HomeAppBar(),
          ),
        ),
      ),
    );

    expect(find.byTooltip('Search'), findsOneWidget);
    expect(find.byTooltip('Notifications'), findsOneWidget);
  });
}
