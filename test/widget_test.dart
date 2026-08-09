import 'package:education_app/src/auth/presentation/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SignInForm password visibility toggle has accessible tooltip', (WidgetTester tester) async {
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

    // Find the IconButton by tooltip 'Show password'
    final showPasswordFinder = find.byTooltip('Show password');
    expect(showPasswordFinder, findsOneWidget);

    // Tap to toggle visibility
    await tester.tap(showPasswordFinder);
    await tester.pump();

    // The tooltip should now be 'Hide password'
    final hidePasswordFinder = find.byTooltip('Hide password');
    expect(hidePasswordFinder, findsOneWidget);
    expect(find.byTooltip('Show password'), findsNothing);
  });
}
