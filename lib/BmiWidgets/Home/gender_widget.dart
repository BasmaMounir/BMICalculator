import 'package:bmi_calculator_app/BmiWidgets/Provider/BmiProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderWidget extends StatefulWidget {
  String gender;
  String genderIcon;
  bool isChecked;

  GenderWidget(
      {super.key,
      required this.gender,
      required this.genderIcon,
      required this.isChecked});

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BmiProvider>(context);
    return Expanded(
      child: InkWell(
        onTap: () {
          widget.isChecked = !widget.isChecked;
          provider.gender = widget.gender;
          setState(() {});
        },
        child: Container(
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: widget.isChecked == true
                  ? const Color(0xffffffff)
                  : const Color(0xffd8d8d8),
              //color: const Color(0xff2765cd),
              border: Border.all(
                  width: 2,
                  color: widget.isChecked == true
                      ? const Color(0xffDB4444)
                      : Colors.transparent)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: widget.isChecked == true ? true : false,
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    color: const Color(0xffDB4444),
                    Icons.check_circle,
                  ),
                ),
              ),
              ImageIcon(
                AssetImage('${widget.genderIcon}'),
                size: 80,
                color: widget.isChecked == true
                    ? const Color(0xffDB4444)
                    : const Color(0xff888888),
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                  child: Text(
                    '${widget.gender}',
                style: const TextStyle(fontSize: 22),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
