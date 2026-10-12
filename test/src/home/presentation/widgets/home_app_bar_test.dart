import 'package:education_app/core/common/app/providers/user_provider.dart';
import 'package:education_app/src/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('HomeAppBar displays icon buttons with correct tooltips', (tester) async {
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

    expect(find.byTooltip('Search'), findsOneWidget);
    expect(find.byTooltip('Notifications'), findsOneWidget);
  });
}
