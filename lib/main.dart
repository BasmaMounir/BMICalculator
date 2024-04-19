import 'package:bmi_calculator_app/BmiWidgets/Home/bmi_calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: BmiCalculator.routeName,
      routes: {
        BmiCalculator.routeName: (context) => const BmiCalculator(),
      },
    );
  }
}
