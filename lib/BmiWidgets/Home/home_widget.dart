import 'package:bmi_calculator_app/BmiWidgets/Home/bmi_calculator_body_widget.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  static const String routeName = 'BMI Calculator';

  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: BmiCalculatorBodyWidget(),
    );
  }
}
