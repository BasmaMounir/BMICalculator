import 'package:bmi_calculator_app/BmiWidgets/Home/bmi_calculator_body_widget.dart';
import 'package:flutter/material.dart';

class BmiCalculator extends StatelessWidget {
  static const String routeName = 'BMI Calculator';

  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: BmiCalculatorBodyWidget(),
    );
  }
}
