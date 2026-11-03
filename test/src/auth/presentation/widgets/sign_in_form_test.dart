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

  testWidgets('renders password visibility toggle with proper tooltip',
      (tester) async {
    await tester.pumpWidget(buildWidget());

    // Initially obscurePassword is true
    final showPasswordFinder = find.byTooltip('Show password');
    expect(showPasswordFinder, findsOneWidget);

    final iconButton = tester.widget<IconButton>(find.byType(IconButton));
    expect(iconButton.tooltip, equals('Show password'));

    // Tap the visibility toggle
    await tester.tap(showPasswordFinder);
    await tester.pump();

    // Now obscurePassword should be false
    final hidePasswordFinder = find.byTooltip('Hide password');
    expect(hidePasswordFinder, findsOneWidget);

    final updatedIconButton =
        tester.widget<IconButton>(find.byType(IconButton));
    expect(updatedIconButton.tooltip, equals('Hide password'));
  });
}
