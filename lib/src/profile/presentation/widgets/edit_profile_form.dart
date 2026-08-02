import 'package:education_app/core/extensions/context_extension.dart';
import 'package:education_app/core/extensions/string_extension.dart';
import 'package:education_app/src/profile/presentation/widgets/edit_profile_form_field.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({
    super.key,
    required this.fullNameController,
    required this.bioController,
    required this.emailController,
    required this.passwordController,
    required this.oldPasswordController,
  });

  final TextEditingController fullNameController;
  final TextEditingController bioController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController oldPasswordController;

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  bool obscureOldPassword = true;
  bool obscureNewPassword = true;

  @override
  void initState() {
    super.initState();
    widget.oldPasswordController.addListener(_onOldPasswordChanged);
  }

  @override
  void dispose() {
    widget.oldPasswordController.removeListener(_onOldPasswordChanged);
    super.dispose();
  }

  void _onOldPasswordChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final isOldPasswordEmpty = widget.oldPasswordController.text.isEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        EditProfileFormField(
          fieldTitle: 'FULL NAME',
          controller: widget.fullNameController,
          hintText: context.currentUser!.fullName,
        ),
        EditProfileFormField(
          fieldTitle: 'EMAIL',
          controller: widget.emailController,
          hintText: context.currentUser!.email.obscureEmail,
        ),
        EditProfileFormField(
          fieldTitle: 'BIO',
          controller: widget.bioController,
          hintText: context.currentUser!.bio ?? 'Bio',
        ),
        EditProfileFormField(
          fieldTitle: 'CURRENT PASSWORD',
          controller: widget.oldPasswordController,
          hintText: '*******',
          obscureText: obscureOldPassword,
          suffixIcon: IconButton(
            onPressed: () => setState(() {
              obscureOldPassword = !obscureOldPassword;
            }),
            icon: Icon(
              obscureOldPassword ? IconlyLight.show : IconlyLight.hide,
              color: Colors.grey,
            ),
            tooltip: obscureOldPassword ? 'Show password' : 'Hide password',
          ),
        ),
        EditProfileFormField(
          fieldTitle: 'NEW PASSWORD',
          controller: widget.passwordController,
          hintText: "New Password",
          readOnly: isOldPasswordEmpty,
          obscureText: obscureNewPassword,
          suffixIcon: IconButton(
            onPressed: isOldPasswordEmpty
                ? null
                : () => setState(() {
                      obscureNewPassword = !obscureNewPassword;
                    }),
            icon: Icon(
              obscureNewPassword ? IconlyLight.show : IconlyLight.hide,
              color: isOldPasswordEmpty
                  ? Colors.grey.shade300
                  : Colors.grey,
            ),
            tooltip: isOldPasswordEmpty
                ? 'Enter current password first'
                : (obscureNewPassword ? 'Show password' : 'Hide password'),
          ),
        ),
      ],
    );
  }
}
