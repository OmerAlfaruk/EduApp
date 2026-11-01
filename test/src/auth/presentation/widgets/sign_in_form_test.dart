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
      'Password visibility toggle has appropriate tooltip and updates on tap',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());

    // Initially password is obscured, tooltip should be 'Show password'
    final showPasswordFinder = find.byTooltip('Show password');
    expect(showPasswordFinder, findsOneWidget);

    // Tap to show password
    await tester.tap(showPasswordFinder);
    await tester.pump();

    // Now password is visible, tooltip should update to 'Hide password'
    expect(find.byTooltip('Hide password'), findsOneWidget);
    expect(find.byTooltip('Show password'), findsNothing);

    // Tap again to hide password
    await tester.tap(find.byTooltip('Hide password'));
    await tester.pump();

    expect(find.byTooltip('Show password'), findsOneWidget);
    expect(find.byTooltip('Hide password'), findsNothing);
  });
}
