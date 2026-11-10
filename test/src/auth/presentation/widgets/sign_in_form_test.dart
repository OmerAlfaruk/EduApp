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
      'SignInForm password visibility IconButton has correct tooltip and updates on toggle',
      (tester) async {
    await tester.pumpWidget(buildWidget());

    // Initially obscurePassword is true, tooltip should be 'Show password'
    expect(find.byTooltip('Show password'), findsOneWidget);
    expect(find.byTooltip('Hide password'), findsNothing);

    // Tap the visibility toggle
    await tester.tap(find.byTooltip('Show password'));
    await tester.pump();

    // Now obscurePassword is false, tooltip should be 'Hide password'
    expect(find.byTooltip('Show password'), findsNothing);
    expect(find.byTooltip('Hide password'), findsOneWidget);

    // Tap again to obscure password
    await tester.tap(find.byTooltip('Hide password'));
    await tester.pump();

    // Tooltip should be back to 'Show password'
    expect(find.byTooltip('Show password'), findsOneWidget);
    expect(find.byTooltip('Hide password'), findsNothing);
  });
}
