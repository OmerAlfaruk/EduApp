import 'package:education_app/src/auth/presentation/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SignInForm password visibility toggle updates tooltip',
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

    // Initial state: password obscured -> tooltip should be 'Show password'
    expect(find.byTooltip('Show password'), findsOneWidget);
    expect(find.byTooltip('Hide password'), findsNothing);

    // Tap the toggle button
    await tester.tap(find.byTooltip('Show password'));
    await tester.pump();

    // Updated state: password visible -> tooltip should be 'Hide password'
    expect(find.byTooltip('Hide password'), findsOneWidget);
    expect(find.byTooltip('Show password'), findsNothing);
  });
}
