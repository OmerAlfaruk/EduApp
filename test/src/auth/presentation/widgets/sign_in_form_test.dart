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

  Widget makeTestableWidget() {
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
      'password visibility IconButton should render tooltip "Show password" initially '
      'and "Hide password" when toggled', (tester) async {
    await tester.pumpWidget(makeTestableWidget());

    final showPasswordIconButton = find.byWidgetPredicate(
      (widget) =>
          widget is IconButton && widget.tooltip == 'Show password',
    );
    expect(showPasswordIconButton, findsOneWidget);

    await tester.tap(showPasswordIconButton);
    await tester.pump();

    final hidePasswordIconButton = find.byWidgetPredicate(
      (widget) =>
          widget is IconButton && widget.tooltip == 'Hide password',
    );
    expect(hidePasswordIconButton, findsOneWidget);
  });
}
