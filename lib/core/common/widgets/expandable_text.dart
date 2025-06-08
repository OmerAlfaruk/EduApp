import 'package:education_app/core/extensions/context_extension.dart';
import 'package:education_app/core/res/colours.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText(
      {super.key, required this.context, required this.text, this.style});
  final String text;
  final TextStyle? style;

  final BuildContext context;
  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool expanded = false;
  late TextSpan textSpan;
  late TextPainter textPainter;

  @override
  void initState() {
    textPainter = TextPainter(
      text: TextSpan(
        text: widget.text,
        style: widget.style?.copyWith(color: Colours.neutralTextColour),
      ),
      maxLines: 2,
      textDirection: TextDirection.ltr,
    )..layout(
        maxWidth: widget.context.width * .9,
      );
    textSpan = TextSpan(
      text: widget.text,
      style: widget.style?.copyWith(color: Colours.neutralTextColour),
      children: [
        TextSpan(
          text: expanded ? ' Show less' : ' Show more',
          style: const TextStyle(
            color: Colours.primaryColour,

          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              setState(() {
                expanded = !expanded;
                textPainter = TextPainter(
                  text: textSpan,
                  maxLines: expanded ? null : 2,
                  textDirection: TextDirection.ltr,
                )..layout(
                    maxWidth: widget.context.width * .9,
                  );
              });
            },
        ),
      ],
    );
    super.initState();
  }

  @override
  void dispose() {
    textPainter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const defaultStyle = TextStyle(
      fontSize: 18,
      height: 1.8,
      color: Colours.neutralTextColour,
    );

    return Container(
      child: textPainter.didExceedMaxLines
          ? RichText(
              text: TextSpan(
                text: expanded
                    ? widget.text
                    : '${widget.text.substring(0, textPainter.getPositionForOffset(
                          Offset(widget.context.width * .9, context.height),
                        ).offset)}...',
                style: widget.style ?? defaultStyle,
                children: [
                  TextSpan(
                    text: expanded ? ' Show less' : ' Show more',
                    style: const TextStyle(
                      color: Colours.primaryColour,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          expanded = !expanded;

                        });
                      },
                  ),

                ]
              ),

            )
          : Text(
              widget.text,
              style: widget.style ?? defaultStyle,
            ),
    );
  }
}
