import 'package:education_app/core/common/widgets/i_field.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class EditProfileFormField extends StatefulWidget {
  const EditProfileFormField({
    super.key,
    required this.fieldTitle,
    required this.controller,
    required this.hintText,
    this.readOnly = false,
    this.isPassword = false,
  });

  final String fieldTitle;
  final String hintText;
  final TextEditingController controller;
  final bool readOnly;
  final bool isPassword;

  @override
  State<EditProfileFormField> createState() => _EditProfileFormFieldState();
}

class _EditProfileFormFieldState extends State<EditProfileFormField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            widget.fieldTitle,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        IField(
          controller: widget.controller,
          hintText: widget.hintText,
          readOnly: widget.readOnly,
          obscureText: obscureText,
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () => setState(() {
                    obscureText = !obscureText;
                  }),
                  tooltip: obscureText ? 'Show password' : 'Hide password',
                  icon: Icon(
                    obscureText ? IconlyLight.show : IconlyLight.hide,
                    color: Colors.grey,
                  ),
                )
              : null,
        ),
        const SizedBox(height: 30,),
      ],
    );
  }
}
