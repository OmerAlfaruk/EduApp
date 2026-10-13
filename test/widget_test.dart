import 'package:education_app/src/auth/presentation/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SignInForm password toggle IconButton has accessible tooltip',
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
    final showPasswordIconButton = find.byTooltip('Show password');
    expect(showPasswordIconButton, findsOneWidget);

    // Tap to toggle password visibility
    await tester.tap(showPasswordIconButton);
    await tester.pump();

    // Verify tooltip changes to 'Hide password'
    expect(find.byTooltip('Hide password'), findsOneWidget);
    expect(find.byTooltip('Show password'), findsNothing);
  });
}
