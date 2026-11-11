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
      'both password and confirm password toggles have correct tooltips and update independently',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());

    // Initially both fields are obscured, so there should be two 'Show password' tooltips
    expect(find.byTooltip('Show password'), findsNWidgets(2));
    expect(find.byTooltip('Hide password'), findsNothing);

    // Tap first toggle (password)
    await tester.tap(find.byTooltip('Show password').first);
    await tester.pump();

    // Now one 'Hide password' and one 'Show password'
    expect(find.byTooltip('Hide password'), findsOneWidget);
    expect(find.byTooltip('Show password'), findsOneWidget);

    // Tap the remaining 'Show password' toggle (confirm password)
    await tester.tap(find.byTooltip('Show password'));
    await tester.pump();

    // Now both are 'Hide password'
    expect(find.byTooltip('Hide password'), findsNWidgets(2));
    expect(find.byTooltip('Show password'), findsNothing);
  });
}
