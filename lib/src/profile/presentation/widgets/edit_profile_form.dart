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
  Widget build(BuildContext context) {
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
            tooltip: obscureOldPassword ? 'Show password' : 'Hide password',
            icon: Icon(
              obscureOldPassword ? IconlyLight.show : IconlyLight.hide,
              color: Colors.grey,
            ),
          ),
        ),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: widget.oldPasswordController,
          builder: (context, value, _) {
            final isOldPasswordEmpty = value.text.isEmpty;
            return EditProfileFormField(
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
                tooltip: obscureNewPassword ? 'Show password' : 'Hide password',
                icon: Icon(
                  obscureNewPassword ? IconlyLight.show : IconlyLight.hide,
                  color: isOldPasswordEmpty
                      ? Colors.grey.shade300
                      : Colors.grey,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
