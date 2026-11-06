import 'package:education_app/src/auth/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController fullNameController;
  late GlobalKey<FormState> formKey;

  setUp(() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    fullNameController = TextEditingController();
    formKey = GlobalKey<FormState>();
  });

  tearDown(() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    fullNameController.dispose();
  });

  Widget buildWidget() {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: SignUpForm(
            emailController: emailController,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            fullNameController: fullNameController,
            formKey: formKey,
          ),
        ),
      ),
    );
  }

  testWidgets(
      'password and confirm password toggle buttons have accessible tooltips and update on tap',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());

    final iconButtonsFinder = find.byType(IconButton);
    expect(iconButtonsFinder, findsNWidgets(2));

    // First IconButton is for password, second is for confirm password
    final firstButton = tester.widget<IconButton>(iconButtonsFinder.at(0));
    final secondButton = tester.widget<IconButton>(iconButtonsFinder.at(1));

    expect(firstButton.tooltip, 'Show password');
    expect(secondButton.tooltip, 'Show password');

    // Tap the first button (password visibility)
    await tester.tap(iconButtonsFinder.at(0));
    await tester.pump();

    expect(
      tester.widget<IconButton>(iconButtonsFinder.at(0)).tooltip,
      'Hide password',
    );
    expect(
      tester.widget<IconButton>(iconButtonsFinder.at(1)).tooltip,
      'Show password',
    );

    // Tap the second button (confirm password visibility)
    await tester.tap(iconButtonsFinder.at(1));
    await tester.pump();

    expect(
      tester.widget<IconButton>(iconButtonsFinder.at(0)).tooltip,
      'Hide password',
    );
    expect(
      tester.widget<IconButton>(iconButtonsFinder.at(1)).tooltip,
      'Hide password',
    );
  });
}
