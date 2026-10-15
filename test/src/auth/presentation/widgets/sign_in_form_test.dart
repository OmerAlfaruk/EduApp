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

  testWidgets('renders password visibility toggle with state-dependent tooltip',
      (tester) async {
    await tester.pumpWidget(makeTestableWidget());

    final toggleButton = find.byType(IconButton);
    expect(toggleButton, findsOneWidget);

    final initialIconButton = tester.widget<IconButton>(toggleButton);
    expect(initialIconButton.tooltip, 'Show password');

    await tester.tap(toggleButton);
    await tester.pump();

    final toggledIconButton = tester.widget<IconButton>(toggleButton);
    expect(toggledIconButton.tooltip, 'Hide password');
  });
}
