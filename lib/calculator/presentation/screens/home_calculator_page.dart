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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CalculatorButton(
                    text: "e",
                    onPressed: () {},
                    height: 40.px,
                    style: theme.textTheme.titleSmall,
                  ),
                  CalculatorButton(
                    text: "π",
                    onPressed: () {},
                    height: 40.px,
                    style: theme.textTheme.titleSmall,
                  ),
                  CalculatorButton(
                    text: "sin",
                    onPressed: () {},
                    height: 40.px,
                    style: theme.textTheme.titleSmall,
                  ),
                  CalculatorButton(
                    text: "deg",
                    onPressed: () {},
                    height: 40.px,
                    style: theme.textTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      )

          ,
    );
  }
}
