import 'package:bmi_calculator_app/BmiWidgets/Provider/BmiProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HeightWidget extends StatefulWidget {
  HeightWidget({super.key});

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BmiProvider>(context);
    return Column(
      children: [
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
            activeColor: Color(0xffDB4444),
            min: 0.0,
            max: 200.0,
            value: provider.heightValue,
            interval: 20,
            showLabels: true,
            //enableTooltip: true,
            minorTicksPerInterval: 10,
            onChanged: (dynamic val) {
              setState(() {
                provider.heightValue = val;
              });
            },
          ),
        ),
      ],
    );
  }
}
