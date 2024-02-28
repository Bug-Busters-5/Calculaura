import 'package:calculaura/app/app_riverpod.dart';
import 'package:calculaura/calculator/presentation/providers/mathematics_riverpod.dart';
import 'package:calculaura/calculator/presentation/widgets/calculator_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeCalculatorPage extends ConsumerStatefulWidget {
  const HomeCalculatorPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeCalculatorPageState();
}

class _HomeCalculatorPageState extends ConsumerState<HomeCalculatorPage> {
  @override
  Widget build(BuildContext context) {
    final calculatorState = ref.watch(calculatorProvider);
    final calculatorNotifier = ref.watch(calculatorProvider.notifier);

    final themeMode = ref.watch(themeProvider);
    final theme = Theme.of(context);
    final numberBackgroundColors = themeMode == ThemeMode.light
        ? Colors.white
        : theme.colorScheme.onSecondaryContainer;
    final operatorBackgroundColors = themeMode == ThemeMode.light
        ? theme.colorScheme.primaryContainer
        : theme.colorScheme.primaryContainer;
    final otherBackgroundColors =
        themeMode == ThemeMode.light ? Colors.white : const Color(0xFF616161);

    void handleButtonPress(String value) {
      if (value == 'Ac') {
        calculatorNotifier.clearAll();
      } else if (value == 'esc') {
        calculatorNotifier.clearLast();
      } else if (value == '=') {
        calculatorNotifier.calculateResult();
      } else if (value == 'e') {
        calculatorNotifier.calculateE();
      } else if (value == 'µ') {
        calculatorNotifier.calculateMicro();
      } else if (value == 'sin') {
        calculatorNotifier.calculateSin();
      } else if (value == 'deg') {
        calculatorNotifier.convertDeg();
      } else {
        if (['-', '+', 'x', '÷'].contains(value)) {
          calculatorNotifier.appendValue(' ');
          calculatorNotifier.appendValue(value);
          calculatorNotifier.appendValue(' ');
        } else {
          calculatorNotifier.appendValue(value);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsetsDirectional.only(start: 12.sp),
          child: GestureDetector(
            onTap: () {
              if (themeMode == ThemeMode.dark) {
                ref.watch(themeProvider.notifier).state = ThemeMode.light;
              } else {
                ref.watch(themeProvider.notifier).state = ThemeMode.dark;
              }
            },
            child: CircleAvatar(
              child: themeMode == ThemeMode.dark
                  ? const Icon(Icons.light_mode)
                  : SvgPicture.asset(
                      'assets/icons/moon.svg',
                      height: 18.sp,
                      width: 18.sp,
                    ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
                child: Column(
                  children: [
                    Text(
                      calculatorState.expression,
                      style: TextStyle(color: theme.colorScheme.outline),
                    ),
                    Text(
                      calculatorState.result,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
                child: LayoutBuilder(builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  final height = constraints.maxHeight;
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width / 4 * 2.98,
                            height: height,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CalculatorButton(
                                      onPressed: () => handleButtonPress("e"),
                                      height: 27.sp,
                                      radius: 50.sp,
                                      text: "e",
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w400,
                                      color: numberBackgroundColors,
                                    ),
                                    CalculatorButton(
                                      onPressed: () => handleButtonPress("µ"),
                                      text: "µ",
                                      height: 27.sp,
                                      radius: 50.sp,
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w400,
                                      color: numberBackgroundColors,
                                    ),
                                    CalculatorButton(
                                      onPressed: () => handleButtonPress("sin"),
                                      text: "sin",
                                      height: 27.sp,
                                      radius: 50.sp,
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w400,
                                      color: numberBackgroundColors,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CalculatorButton(
                                      onPressed: () => handleButtonPress("Ac"),
                                      text: "Ac",
                                      fontSize: 19.sp,
                                      color: otherBackgroundColors,
                                      fontColor: theme.colorScheme.outline,
                                    ),
                                    CalculatorButton(
                                      onPressed: () => handleButtonPress("esc"),
                                      text: "\u232B",
                                      fontSize: 19.sp,
                                      color: otherBackgroundColors,
                                      fontColor: theme.colorScheme.outline,
                                    ),
                                    CalculatorButton(
                                      onPressed: () => handleButtonPress("÷"),
                                      text: "÷",
                                      color: operatorBackgroundColors,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CalculatorButton(
                                      onPressed: () => handleButtonPress("7"),
                                      text: "7",
                                      color: numberBackgroundColors,
                                    ),
                                    CalculatorButton(
                                      onPressed: () => handleButtonPress("8"),
                                      text: "8",
                                      color: numberBackgroundColors,
                                    ),
                                    CalculatorButton(
                                      onPressed: () => handleButtonPress("9"),
                                      text: "9",
                                      color: numberBackgroundColors,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CalculatorButton(
                                      onPressed: () => handleButtonPress("4"),
                                      text: "4",
                                      color: numberBackgroundColors,
                                    ),
                                    CalculatorButton(
                                      onPressed: () => handleButtonPress("5"),
                                      text: "5",
                                      color: numberBackgroundColors,
                                    ),
                                    CalculatorButton(
                                      onPressed: () => handleButtonPress("6"),
                                      text: "6",
                                      color: numberBackgroundColors,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CalculatorButton(
                                      onPressed: () => handleButtonPress("1"),
                                      text: "1",
                                      color: numberBackgroundColors,
                                    ),
                                    CalculatorButton(
                                      onPressed: () => handleButtonPress("2"),
                                      text: "2",
                                      color: numberBackgroundColors,
                                    ),
                                    CalculatorButton(
                                      onPressed: () => handleButtonPress("3"),
                                      text: "3",
                                      color: numberBackgroundColors,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CalculatorButton(
                                      onPressed: () => handleButtonPress("0"),
                                      text: "0",
                                      width: 51.5.sp,
                                      color: numberBackgroundColors,
                                    ),
                                    CalculatorButton(
                                      onPressed: () => handleButtonPress("."),
                                      text: ".",
                                      color: numberBackgroundColors,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width / 4,
                            height: height,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CalculatorButton(
                                  onPressed: () {},
                                  text: "deg",
                                  height: 27.sp,
                                  radius: 50.sp,
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.w400,
                                  color: numberBackgroundColors,
                                ),
                                CalculatorButton(
                                  onPressed: () => handleButtonPress("x"),
                                  text: "x",
                                  color: operatorBackgroundColors,
                                ),
                                CalculatorButton(
                                  onPressed: () => handleButtonPress("-"),
                                  text: "-",
                                  color: operatorBackgroundColors,
                                ),
                                CalculatorButton(
                                  onPressed: () => handleButtonPress("+"),
                                  text: "+",
                                  height: 108.px,
                                  color: operatorBackgroundColors,
                                ),
                                CalculatorButton(
                                  onPressed: () => handleButtonPress("="),
                                  text: "=",
                                  height: 108.px,
                                  color: themeMode == ThemeMode.light
                                      ? theme.colorScheme.secondaryContainer
                                      : theme.colorScheme.secondaryContainer,
                                  fontColor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
