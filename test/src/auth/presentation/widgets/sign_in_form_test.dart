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

  Widget createWidgetUnderTest() {
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
    'SignInForm password visibility IconButton has dynamic accessibility tooltip',
    (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Initially password is obscured
      final showButton = find.byTooltip('Show password');
      expect(showButton, findsOneWidget);
      expect(find.byTooltip('Hide password'), findsNothing);

      // Tap to toggle visibility
      await tester.tap(showButton);
      await tester.pump();

      // Tooltip updates to 'Hide password'
      expect(find.byTooltip('Hide password'), findsOneWidget);
      expect(find.byTooltip('Show password'), findsNothing);

      // Tap again to toggle back
      await tester.tap(find.byTooltip('Hide password'));
      await tester.pump();

      expect(find.byTooltip('Show password'), findsOneWidget);
      expect(find.byTooltip('Hide password'), findsNothing);
    },
  );
}
