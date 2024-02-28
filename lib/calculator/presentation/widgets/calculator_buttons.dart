import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CalculatorButton extends ConsumerWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final TextStyle? style;
  final double? radius;
  final bool isOperator;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final double? fontSize;

  const CalculatorButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.color,
    this.style,
    this.radius,
    this.fontColor,
    this.fontWeight,
    this.fontSize,
    this.isOperator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return InkWell(
      highlightColor: Colors.blue.withOpacity(0.4),
      splashColor: Colors.green.withOpacity(0.5),
      borderRadius: BorderRadius.circular(radius ?? 15.sp),
      onTap: onPressed,
      child: Container(
        width: width ?? 33.sp,
        height: height ?? 32.sp,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius ?? 15.sp),
        ),
        child: Center(
          child: Text(
            text,
            style: theme.textTheme.titleMedium!.copyWith(
                fontSize: fontSize ?? 20.sp,
                color: fontColor,
                fontWeight: fontWeight),
          ),
        ),
      ),
    );
  }
}
