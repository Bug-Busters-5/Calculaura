// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

ThemeData lightModeTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: const Color(0xFFADE2FF),
  primaryColorDark: const Color(0xFF19ACFF),
  primaryColorLight: const Color(0xFF7CC9FF),
  backgroundColor: Colors.white,
  textTheme: TextTheme(
    titleMedium: TextStyle(
      color: const Color(0XFF38B9FF),
      fontWeight: FontWeight.w600,
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
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF005DB2),
  primaryColorDark: const Color(0xFF1991FF),
  primaryColorLight: const Color(0xFF29A8FF),
    backgroundColor:const  Color(0xFF17181A),

  textTheme: TextTheme(
    titleMedium: TextStyle(
      color: const Color(0XFF29A8FF),
      fontWeight: FontWeight.w600,
      fontSize: 14.sp,
    ),
    titleSmall: TextStyle(
      color: const Color(0xFF29A8FF),
      fontWeight: FontWeight.w600,
      fontSize: 12.sp,
    ),
    labelLarge: TextStyle(
      color: const Color(0xFFA5A5A5),
      fontWeight: FontWeight.w600,
      fontSize: 14.sp,
    ),
  ),
);
