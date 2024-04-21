import 'package:flutter/material.dart';

class BmiProvider extends ChangeNotifier {
  int ageCounter = 0;
  int weightValue = 5;
  double heightValue = 50;

  double bmi = 0.0;
  String gender = '';
  String bmiCategory = '';
  String bmiCategoryHint = '';

  String GetInformationAboutBmiCategory(double bmi) {
    if (bmi < 18.5) {
      bmiCategory = 'under weight';
      notifyListeners();
    } else if (18.5 <= bmi && bmi < 25) {
      bmiCategory = 'normal weight';
      notifyListeners();
    } else if (25 <= bmi && bmi < 30) {
      bmiCategory = 'over weight';
      notifyListeners();
    } else {
      bmiCategory = 'obese';
      notifyListeners();
    }
    return bmiCategory;
  }

  String GetInformationAboutBmiCategoryHint(double bmi) {
    if (bmiCategory == 'under weight') {
      bmiCategoryHint =
          '''◼Individuals with a BMI below 18.5 are considered underweight.
◼Being underweight may indicate that a person is not consuming enough calories or nutrients to maintain optimal health.
◼Health risks associated with being underweight include weakened immune function, nutrient deficiencies, and osteoporosis.''';
    } else if (bmiCategory == 'normal weight') {
      bmiCategoryHint =
          '''◼A BMI between 18.5 and 24.9 falls within the normal weight range.
◼Individuals within this range typically have a healthy balance of body fat and muscle mass.
◼Maintaining a normal weight is associated with reduced risk of chronic diseases such as heart disease, diabetes, and certain cancers.''';
    } else if (bmiCategory == 'over weight') {
      bmiCategoryHint =
          '''◼A BMI between 25 and 29.9 indicates that a person is overweight.
◼Being overweight may result from excess body fat accumulation, often due to overeating and insufficient physical activity.
◼Health risks associated with being overweight include high blood pressure, elevated cholesterol levels, and an increased risk of heart disease and stroke.''';
    } else if (bmiCategory == 'obese') {
      bmiCategoryHint =
          '''◼Individuals with a BMI of 30 or higher are classified as obese.
◼Obesity significantly increases the risk of various health conditions, including type 2 diabetes, sleep apnea, certain cancers, and joint problems.
◼Managing obesity often requires lifestyle changes such as adopting a balanced diet, increasing physical activity, and potentially medical interventions under the guidance of healthcare professionals.''';
    }

    return bmiCategoryHint;
  }

  void CalculateBmi(int weight, double height) {
    bmi = weight / (height / 100 * height / 100);
    notifyListeners();
  }
}
