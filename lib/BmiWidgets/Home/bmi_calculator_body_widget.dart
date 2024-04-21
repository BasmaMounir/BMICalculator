import 'package:bmi_calculator_app/BmiWidgets/Home/age_weight_widget.dart';
import 'package:bmi_calculator_app/BmiWidgets/Home/gender_widget.dart';
import 'package:bmi_calculator_app/BmiWidgets/Home/height_widget.dart';
import 'package:bmi_calculator_app/BmiWidgets/Provider/BmiProvider.dart';
import 'package:bmi_calculator_app/BmiWidgets/Result/PersonData.dart';
import 'package:bmi_calculator_app/BmiWidgets/Result/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiCalculatorBodyWidget extends StatefulWidget {
  BmiCalculatorBodyWidget({super.key});

  @override
  State<BmiCalculatorBodyWidget> createState() =>
      _BmiCalculatorBodyWidgetState();
}

class _BmiCalculatorBodyWidgetState extends State<BmiCalculatorBodyWidget> {
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BmiProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Gender',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GenderWidget(
                isChecked: isMaleSelected,
                gender: 'Male',
                genderIcon: 'assets/images/male.png',
              ),
              const SizedBox(width: 10),
              GenderWidget(
                isChecked: isFemaleSelected,
                genderIcon: 'assets/images/female.png',
                gender: 'Female',
              ),
            ],
          ),
          HeightWidget(),
          AgeAndWeightWidget(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffDB4444),
                  foregroundColor: Colors.white),
              onPressed: () {
                provider.CalculateBmi(
                    provider.weightValue, provider.heightValue);
                provider.GetInformationAboutBmiCategory(provider.bmi);
                provider.GetInformationAboutBmiCategoryHint(provider.bmi);
                Navigator.pushNamed(context, ResultScreen.routeName,
                    arguments: PersonData(
                        gender: provider.gender,
                        height: provider.heightValue,
                        age: provider.ageCounter,
                        bmi: provider.bmi,
                        weight: provider.weightValue));
              },
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Calculate BMI',
                  style: TextStyle(fontSize: 22),
                ),
              ))
        ],
      ),
    );
  }
}
