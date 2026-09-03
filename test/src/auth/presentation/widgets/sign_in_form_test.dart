import 'package:education_app/src/auth/presentation/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SignInForm password toggle updates tooltip on tap',
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

    // Initially password is obscured, so tooltip should say 'Show password'
    expect(find.byTooltip('Show password'), findsOneWidget);
    expect(find.byTooltip('Hide password'), findsNothing);

    // Tap the password visibility toggle IconButton
    await tester.tap(find.byTooltip('Show password'));
    await tester.pump();

    // Now password is visible, tooltip should update to 'Hide password'
    expect(find.byTooltip('Hide password'), findsOneWidget);
    expect(find.byTooltip('Show password'), findsNothing);
  });
}
