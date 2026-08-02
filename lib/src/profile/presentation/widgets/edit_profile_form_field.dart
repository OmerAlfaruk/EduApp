import 'package:education_app/core/common/widgets/i_field.dart';
import 'package:flutter/material.dart';

class EditProfileFormField extends StatelessWidget {
  const EditProfileFormField({
    super.key,
    required this.fieldTitle,
    required this.controller,
    required this.hintText,
    this.readOnly = false,
    this.obscureText = false,
    this.suffixIcon,
  });
  final String fieldTitle;
  final String hintText;
  final TextEditingController controller;
  final bool readOnly;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            fieldTitle,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        IField(
          controller: controller,
          hintText: hintText,
          readOnly: readOnly,
          obscureText: obscureText,
          suffixIcon: suffixIcon,
        ),
        const SizedBox(height: 30,),
      ],
    );
  }
}
