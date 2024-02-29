import 'package:calculaura/app/app_riverpod.dart';
import 'package:calculaura/calculator/presentation/screens/home_calculator_page.dart';
import 'package:calculaura/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1),
              ),
              child: child!,
            );
          },
          debugShowCheckedModeBanner: false,
          title: 'calculaura',
          home: const HomeCalculatorPage(),
          theme: lightModeTheme,
          darkTheme: darkModeTheme,
          themeMode: themeMode,
        );
      },
    );
  }
}
