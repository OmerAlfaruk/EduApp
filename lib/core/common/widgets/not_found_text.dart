import 'package:education_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class NotFoundText extends StatelessWidget {
  final String? message;
  const NotFoundText({
    super.key, this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          message ?? 'No data found',
          style: context.theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.grey.withOpacity(.5)),
        ),
      ),
    );
  }
}