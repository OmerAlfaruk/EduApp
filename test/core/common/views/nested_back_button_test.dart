import 'package:education_app/core/common/views/nested_back_button.dart';
import 'package:education_app/src/auth/presentation/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IconButton Accessibility Tooltips', () {
    testWidgets('NestedBackButton has a "Back" tooltip',
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
      expect(iconButton.tooltip, equals('Back'));
    });

    testWidgets('SignInForm password toggle has dynamic tooltip state',
        (WidgetTester tester) async {
      final emailController = TextEditingController();
      final passwordController = TextEditingController();
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SignInForm(
              emailController: emailController,
              passwordController: passwordController,
              formKey: formKey,
            ),
          ),
        ),
      );

      // Initially password is obscure, tooltip should be "Show password"
      final iconButtonFinder = find.byType(IconButton);
      expect(iconButtonFinder, findsOneWidget);

      IconButton iconButton = tester.widget(iconButtonFinder);
      expect(iconButton.tooltip, equals('Show password'));

      // Tap to toggle visibility
      await tester.tap(iconButtonFinder);
      await tester.pump();

      // Now password is visible, tooltip should be "Hide password"
      iconButton = tester.widget(iconButtonFinder);
      expect(iconButton.tooltip, equals('Hide password'));
    });
  });
}
