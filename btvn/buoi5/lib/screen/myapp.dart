import 'package:buoi5/model/result_model.dart';
import 'package:buoi5/provider/calculate_provider.dart';
import 'package:buoi5/screen/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _CalculatorState();
}

class _CalculatorState extends State<MyApp> {
  // void resetForm(result) {
  //   firstNumber.clear();
  //   secNumber.clear();
  // }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CalculateProvider()),
        ChangeNotifierProvider(create: (context) => ResultModel(result: "")),
      ],
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: const MaterialApp(home: CalculatorScreen()),
        );
      },
    );
  }
}
