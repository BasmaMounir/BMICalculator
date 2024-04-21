import 'package:bmi_calculator_app/BmiWidgets/Home/home_widget.dart';
import 'package:bmi_calculator_app/BmiWidgets/Provider/BmiProvider.dart';
import 'package:bmi_calculator_app/BmiWidgets/Result/CustomeWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  static const String routeName = "Result Screen";

  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BmiProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Back',
          style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inder'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Result',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inder'),
                ),
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  'Your BMI is',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: const Color(0xffDB4444),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  '${provider.bmi.toStringAsFixed(2)}\n kg/m2',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: Text(
                  '(${provider.bmiCategory})',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(
                            provider.gender == 'Male'
                                ? Icons.male
                                : Icons.female,
                            size: 40,
                          ),
                          Text(
                            '${provider.gender}',
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 20),
                          ),
                        ],
                      ),
                      CustomWidget(
                          title: '${provider.ageCounter}', titleValue: 'Age'),
                      CustomWidget(
                          title: '${provider.heightValue.toStringAsFixed(0)}',
                          titleValue: 'Height'),
                      CustomWidget(
                          title: '${provider.weightValue}',
                          titleValue: 'Weight'),
                    ],
                  )),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 2),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  provider.bmiCategoryHint,
                  style: const TextStyle(color: Colors.black54, fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xffDB4444),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, HomeWidget.routeName);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'TRY AGAIN',
                          style: TextStyle(fontSize: 22),
                        ),
                        Icon(Icons.refresh_outlined)
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
