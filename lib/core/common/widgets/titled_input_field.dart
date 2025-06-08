import 'package:flutter/material.dart';

import 'i_field.dart';

class TitledInputField extends StatelessWidget {
  const TitledInputField(
      {super.key,
    this.required=true,
      required this.title,
      this.hintText,
      required this.controller,
      this.hintStyle,
      this.suffixIcon});

  final bool required;
  final String title;
  final String? hintText;
  final TextEditingController controller;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  if (required)
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
            ),
            if (suffixIcon != null) suffixIcon!,
          ],
        ),
        const SizedBox(height: 8),
        IField(
          controller: controller,
          hintText: hintText?? 'Enter $title',
          hintStyle: hintStyle,
          overrideValidator: true,
          validator: (value) {
            if (required && (value == null || value.isEmpty)) {
              return '$title is required';
            }
            return null;
          },
        ),
      ],
    );
  }
}
