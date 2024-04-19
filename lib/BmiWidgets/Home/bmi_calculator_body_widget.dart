import 'package:bmi_calculator_app/BmiWidgets/Home/gender_widget.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BmiCalculatorBodyWidget extends StatefulWidget {
  BmiCalculatorBodyWidget({super.key});

  int ageCounter = 0;
  int weightValue = 5;
  double heightValue = 50.0, bmi = 0.0;

  @override
  State<BmiCalculatorBodyWidget> createState() =>
      _BmiCalculatorBodyWidgetState();
}

class _BmiCalculatorBodyWidgetState extends State<BmiCalculatorBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
                gender: 'Male',
                genderIcon: 'assets/images/male.png',
              ),
              const SizedBox(width: 10),
              GenderWidget(
                genderIcon: 'assets/images/female.png',
                gender: 'Female',
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Height (cm)',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: SfSlider(
              min: 0.0,
              max: 200.0,
              value: widget.heightValue,
              interval: 20,
              //showTicks: true,
              showLabels: true,
              enableTooltip: true,
              minorTicksPerInterval: 2,
              onChanged: (dynamic value) {
                setState(() {
                  widget.heightValue = value;
                });
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text(
                    'Age',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: Colors.black12)),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.indeterminate_check_box_outlined,
                            size: 35,
                          ),
                          onPressed: () {
                            setState(() {
                              widget.ageCounter--;
                            });
                          },
                        ),
                        Text(
                          '${widget.ageCounter}',
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                widget.ageCounter++;
                              });
                            },
                            icon: const Icon(
                              Icons.add_box_outlined,
                              size: 35,
                            )),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Weight (kg)',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 120,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: Colors.black12),
                    ),
                    child: NumberPicker(
                      axis: Axis.horizontal,
                      value: widget.weightValue,
                      textStyle: const TextStyle(fontSize: 25),
                      minValue: 3,
                      maxValue: 400,
                      onChanged: (value) =>
                          setState(() => widget.weightValue = value),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff2765cd),
                  foregroundColor: Colors.white),
              onPressed: () {},
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
