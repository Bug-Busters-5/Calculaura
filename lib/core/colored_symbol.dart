import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

List<TextSpan> coloredSymbol(String source) {
  String symbol = '+';
  if (symbol.isEmpty || !source.toLowerCase().contains(symbol)) {
    return [TextSpan(text: source)];
  }
  final matches = symbol.allMatches(source);

  int lastMatchEnd = 0;

  final List<TextSpan> children = [];
  for (var i = 0; i < matches.length; i++) {
    final match = matches.elementAt(i);

    if (match.start != lastMatchEnd) {
      children.add(TextSpan(
        text: source.substring(lastMatchEnd, match.start),
      ));
    }

    children.add(TextSpan(
        text: source.substring(match.start, match.end),
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w400,
          fontSize: 18.sp,
        )));

    if (i == matches.length - 1 && match.end != source.length) {
      children.add(TextSpan(
        text: source.substring(match.end, source.length),
      ));
    }

    lastMatchEnd = match.end;
  }
  return children;
}
