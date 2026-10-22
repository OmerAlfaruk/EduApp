import 'package:education_app/src/auth/presentation/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SignInForm password visibility IconButton has correct state-appropriate tooltips',
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

    // Verify initial tooltip is 'Show password'
    final iconButtonFinder = find.byType(IconButton);
    expect(iconButtonFinder, findsOneWidget);

    final initialIconButton = tester.widget<IconButton>(iconButtonFinder);
    expect(initialIconButton.tooltip, 'Show password');

    // Tap the toggle button to reveal password
    await tester.tap(iconButtonFinder);
    await tester.pump();

    // Verify updated tooltip is 'Hide password'
    final toggledIconButton = tester.widget<IconButton>(iconButtonFinder);
    expect(toggledIconButton.tooltip, 'Hide password');
  });
}
