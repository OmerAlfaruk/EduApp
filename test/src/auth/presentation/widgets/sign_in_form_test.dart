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
    'SignInForm renders password visibility toggle with stateful tooltips',
    (WidgetTester tester) async {
      await tester.pumpWidget(buildWidget());

      // Find the IconButton with initial tooltip 'Show password'
      final showPasswordButtonFinder = find.byTooltip('Show password');
      expect(showPasswordButtonFinder, findsOneWidget);

      // Tap to toggle visibility
      await tester.tap(showPasswordButtonFinder);
      await tester.pump();

      // Tooltip should now be 'Hide password'
      expect(find.byTooltip('Show password'), findsNothing);
      final hidePasswordButtonFinder = find.byTooltip('Hide password');
      expect(hidePasswordButtonFinder, findsOneWidget);

      // Tap again to toggle back
      await tester.tap(hidePasswordButtonFinder);
      await tester.pump();

      // Tooltip should be 'Show password' again
      expect(find.byTooltip('Show password'), findsOneWidget);
      expect(find.byTooltip('Hide password'), findsNothing);
    },
  );
}
