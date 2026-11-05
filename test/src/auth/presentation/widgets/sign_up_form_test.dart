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

  Widget createWidgetUnderTest() {
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
    'shows "Show password" tooltip for password and confirm password initially, '
    'and updates independently on toggle',
    (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Both buttons should initially have 'Show password' tooltip
      expect(find.byTooltip('Show password'), findsNWidgets(2));
      expect(find.byTooltip('Hide password'), findsNothing);

      // Tap first toggle (password field)
      await tester.tap(find.byTooltip('Show password').first);
      await tester.pump();

      expect(find.byTooltip('Hide password'), findsOneWidget);
      expect(find.byTooltip('Show password'), findsOneWidget);

      // Tap second toggle (confirm password field)
      await tester.tap(find.byTooltip('Show password'));
      await tester.pump();

      expect(find.byTooltip('Hide password'), findsNWidgets(2));
      expect(find.byTooltip('Show password'), findsNothing);
    },
  );
}
