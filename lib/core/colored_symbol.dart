import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

List<TextSpan> coloredSymbol(String source) {
  final symbols = ['+', '-', '÷', 'x'];

   final pattern =
      RegExp(symbols.map((symbol) => RegExp.escape(symbol)).join('|'));

  if (!pattern.hasMatch(source)) {
    return [TextSpan(text: source)];
  }

  final matches = pattern.allMatches(source);
  int lastMatchEnd = 0;
  final List<TextSpan> children = [];

  for (final match in matches) {
    if (match.start != lastMatchEnd) {
      children.add(TextSpan(
        text: source.substring(lastMatchEnd, match.start),
      ));
    }
    children.add(
      TextSpan(
        text: source.substring(match.start, match.end),
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w400,
          fontSize: 18.sp,
        ),
      ),
    );

    lastMatchEnd = match.end;
  }
  if (lastMatchEnd < source.length) {
    children.add(TextSpan(
      text: source.substring(lastMatchEnd),
    ));
  }
  return children;
}
  