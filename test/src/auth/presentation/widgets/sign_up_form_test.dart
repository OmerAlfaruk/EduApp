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
    'SignUpForm password and confirm password buttons have dynamic tooltips',
    (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Initially both fields are obscured
      expect(find.byTooltip('Show password'), findsOneWidget);
      expect(find.byTooltip('Show confirm password'), findsOneWidget);
      expect(find.byTooltip('Hide password'), findsNothing);
      expect(find.byTooltip('Hide confirm password'), findsNothing);

      // Toggle password visibility
      await tester.tap(find.byTooltip('Show password'));
      await tester.pump();

      expect(find.byTooltip('Hide password'), findsOneWidget);
      expect(find.byTooltip('Show password'), findsNothing);
      expect(find.byTooltip('Show confirm password'), findsOneWidget);

      // Toggle confirm password visibility
      await tester.tap(find.byTooltip('Show confirm password'));
      await tester.pump();

      expect(find.byTooltip('Hide password'), findsOneWidget);
      expect(find.byTooltip('Hide confirm password'), findsOneWidget);
      expect(find.byTooltip('Show confirm password'), findsNothing);

      // Toggle password back
      await tester.tap(find.byTooltip('Hide password'));
      await tester.pump();

      expect(find.byTooltip('Show password'), findsOneWidget);
      expect(find.byTooltip('Hide confirm password'), findsOneWidget);
    },
  );
}
