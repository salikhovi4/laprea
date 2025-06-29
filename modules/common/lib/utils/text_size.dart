import 'package:flutter/material.dart';

Size textSize(String text, TextStyle style, double maxTitleWidth, [int? maxLines]) {
  final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines ?? 20,
      textDirection: TextDirection.ltr)
    ..layout(minWidth: 0, maxWidth: maxTitleWidth);
  return textPainter.size;
}
