import 'package:education_app/src/auth/presentation/widgets/sign_in_form.dart';
import 'package:education_app/src/auth/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SignInForm password toggle has accessible tooltip',
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

    expect(find.byTooltip('Show password'), findsOneWidget);

    await tester.tap(find.byTooltip('Show password'));
    await tester.pump();

    expect(find.byTooltip('Hide password'), findsOneWidget);
  });

  testWidgets('SignUpForm password toggles have accessible tooltips',
      (WidgetTester tester) async {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final fullNameController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SignUpForm(
            emailController: emailController,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            fullNameController: fullNameController,
            formKey: formKey,
          ),
        ),
      ),
    );

    expect(find.byTooltip('Show password'), findsOneWidget);
    expect(find.byTooltip('Show confirm password'), findsOneWidget);

    await tester.tap(find.byTooltip('Show password'));
    await tester.pump();

    expect(find.byTooltip('Hide password'), findsOneWidget);
  });
}
