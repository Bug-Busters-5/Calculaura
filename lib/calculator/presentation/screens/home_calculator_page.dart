import 'package:calculaura/app/app_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeCalculatorPage extends ConsumerStatefulWidget {
  const HomeCalculatorPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeCalculatorPageState();
}

class _HomeCalculatorPageState extends ConsumerState<HomeCalculatorPage> {

  @override
  Widget build(BuildContext context) {
        final themeMode = ref.watch(themeProvider);

    return   Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              ref.watch(themeProvider.notifier).state = 
                themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
            },
          ),
        ],
      ),
    
      body:  const Center(
        child: Text("here the calculator page"),
      ),
    );
  }
}