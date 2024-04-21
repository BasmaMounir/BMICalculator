import 'package:bmi_calculator_app/BmiWidgets/Home/home_widget.dart';
import 'package:bmi_calculator_app/BmiWidgets/Provider/BmiProvider.dart';
import 'package:bmi_calculator_app/BmiWidgets/Result/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => BmiProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeWidget.routeName,
      routes: {
        HomeWidget.routeName: (context) => const HomeWidget(),
        ResultScreen.routeName: (context) => const ResultScreen()
      },
    );
  }
}
