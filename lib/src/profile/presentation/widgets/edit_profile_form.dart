import 'package:education_app/core/extensions/context_extension.dart';
import 'package:education_app/core/extensions/string_extension.dart';
import 'package:education_app/src/profile/presentation/widgets/edit_profile_form_field.dart';
import 'package:flutter/material.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm(
      {super.key,
      required this.fullNameController,
      required this.bioController,
      required this.emailController,
      required this.passwordController,
      required this.oldPasswordController});
  final TextEditingController fullNameController;
  final TextEditingController bioController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController oldPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        EditProfileFormField(
            fieldTitle: 'FULL NAME',
            controller: fullNameController,
            hintText: context.currentUser!.fullName),
        EditProfileFormField(
            fieldTitle: 'EMAIL',
            controller: emailController,
            hintText: context.currentUser!.email.obscureEmail),
        EditProfileFormField(
            fieldTitle: 'BIO',
            controller: bioController,
            hintText: context.currentUser!.bio ?? 'Bio'),
        EditProfileFormField(
            fieldTitle: 'CURRENT PASSWORD',
            controller: oldPasswordController,
            hintText: '*******',

        ),
        StatefulBuilder(
          builder: (__,setState) {
            oldPasswordController.addListener(()=>setState((){}));
            return EditProfileFormField(
                fieldTitle: 'NEW PASSWORD',
                controller: passwordController,
                hintText: "New Password",
              readOnly: oldPasswordController.text.isEmpty,
            );
          }
        ),
      ],
    );
  }
}
