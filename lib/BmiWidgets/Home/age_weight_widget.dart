import 'package:bmi_calculator_app/BmiWidgets/Provider/BmiProvider.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class AgeAndWeightWidget extends StatefulWidget {
  AgeAndWeightWidget({super.key});

  @override
  State<AgeAndWeightWidget> createState() => _AgeAndWeightWidgetState();
}

class _AgeAndWeightWidgetState extends State<AgeAndWeightWidget> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BmiProvider>(context);
    return Column(
      children: [
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
                            provider.ageCounter--;
                          });
                        },
                      ),
                      Text(
                        '${provider.ageCounter}',
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              provider.ageCounter++;
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
                    value: provider.weightValue,
                    textStyle: const TextStyle(fontSize: 25),
                    minValue: 3,
                    maxValue: 400,
                    onChanged: (value) =>
                        setState(() => provider.weightValue = value),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
