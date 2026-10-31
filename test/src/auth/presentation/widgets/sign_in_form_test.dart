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

  testWidgets('renders password visibility toggle with dynamic tooltip',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildWidget());

    // Initially, obscurePassword is true, so tooltip should be 'Show password'
    final initialIconButtonFinder = find.byWidgetPredicate(
      (widget) => widget is IconButton && widget.tooltip == 'Show password',
    );
    expect(initialIconButtonFinder, findsOneWidget);

    // Tap to toggle visibility
    await tester.tap(initialIconButtonFinder);
    await tester.pumpAndSettle();

    // Now obscurePassword is false, so tooltip should be 'Hide password'
    final toggledIconButtonFinder = find.byWidgetPredicate(
      (widget) => widget is IconButton && widget.tooltip == 'Hide password',
    );
    expect(toggledIconButtonFinder, findsOneWidget);
    expect(initialIconButtonFinder, findsNothing);
  });
}
