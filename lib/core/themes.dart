// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

ThemeData lightModeTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFFADE2FF),
    secondary: const Color(0xFF19ACFF),
    onSecondaryContainer: const Color(0xFF7CC9FF),
    secondaryContainer: const Color(0xFF19ACFF),
    background: const Color(0xFFF7F8FB),
  ),
  textTheme: TextTheme(
    titleMedium: TextStyle(
      color: const Color(0XFF38B9FF),
      fontWeight: FontWeight.w700,
      fontSize: 14.sp,
    ),
    titleSmall: TextStyle(
      color: const Color(0xFF7CC9FF),
      fontWeight: FontWeight.w600,
      fontSize: 12.sp,
    ),
    labelLarge: TextStyle(
      color: const Color(0xFF858585),
      fontWeight: FontWeight.w600,
      fontSize: 14.sp,
    ),
  ),
);

ThemeData darkModeTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color(0xFF005DB2),
    secondary: const Color(0xFF1991FF),
    background: const Color(0xFF17181A),
    onSecondaryContainer: const Color(0xFF303136),
    secondaryContainer: const Color(0xFF1991FF),
  ),
  textTheme: TextTheme(
    titleMedium: TextStyle(
      color: const Color(0XFF29A8FF),
      fontWeight: FontWeight.w600,
      fontSize: 16.sp,
    ),
    titleSmall: TextStyle(
      color: const Color(0xFF29A8FF),
      fontWeight: FontWeight.w600,
      fontSize: 14.sp,
    ),
    labelLarge: TextStyle(
      color: const Color(0xFFA5A5A5),
      fontWeight: FontWeight.w600,
      fontSize: 14.sp,
    ),
  ),
);
