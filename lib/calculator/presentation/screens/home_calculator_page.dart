import 'package:calculaura/app/app_riverpod.dart';
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
    final themeMode = ref.watch(themeProvider);
    final theme = Theme.of(context);
    Widget createButton(
      String text, {
      int flex = 1,
      double? height,
      double? width,
    }) {
      return CalculatorButton(
        text: text,
        onPressed: () {},
        height: height ?? 60.px,
        width: width ?? 62.px,
        style: theme.textTheme.titleSmall,
      );
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
                child: const Center(
                  child: Text("hereee"),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      createButton("e", height: 25.px),
                      createButton("π", height: 25.px),
                      createButton("sin", height: 25.px),
                      createButton("deg", height: 25.px),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                createButton("AC"),
                                createButton("esc"),
                                createButton("/"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                createButton("7"),
                                createButton("8"),
                                createButton("9"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                createButton("4"),
                                createButton("5"),
                                createButton("6"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                createButton("1"),
                                createButton("2"),
                                createButton("3"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                createButton("0", width: 131.px),
                                createButton("."),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            createButton("-"),
                            createButton("*"),
                            createButton("+", height: 93.5.px),
                            createButton("=", height: 93.5.px),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
