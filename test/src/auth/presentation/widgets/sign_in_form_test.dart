import 'package:education_app/src/auth/presentation/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;

  setUp(() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  });

  tearDown(() {
    emailController.dispose();
    passwordController.dispose();
  });

  Widget buildWidget() {
    return MaterialApp(
      home: Scaffold(
        body: SignInForm(
          emailController: emailController,
          passwordController: passwordController,
          formKey: formKey,
        ),
      ),
    );
  }

  testWidgets(
      'password visibility toggle has accessible tooltip and updates on tap',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());

    // Initially obscurePassword is true, so tooltip is 'Show password'
    final initialIconButton = tester.widget<IconButton>(
      find.byType(IconButton),
    );
    expect(initialIconButton.tooltip, 'Show password');

    // Tap the icon button to toggle password visibility
    await tester.tap(find.byType(IconButton));
    await tester.pump();

    // After toggling, obscurePassword is false, so tooltip becomes 'Hide password'
    final toggledIconButton = tester.widget<IconButton>(
      find.byType(IconButton),
    );
    expect(toggledIconButton.tooltip, 'Hide password');
  });
}
