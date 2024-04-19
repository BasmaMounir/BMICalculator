import 'package:flutter/material.dart';

class GenderWidget extends StatefulWidget {
  String gender;
  String genderIcon;

  GenderWidget({super.key, required this.gender, required this.genderIcon});

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          isChecked = !isChecked;
          print('============ $isChecked');
          setState(() {});
        },
        child: Container(
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isChecked == true
                  ? const Color(0xffdfe8f7)
                  : const Color(0xffd8d8d8),
              //color: const Color(0xff2765cd),
              border: Border.all(
                  width: 2,
                  color: isChecked == true
                      ? const Color(0xff2765cd)
                      : Colors.transparent)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: isChecked == true ? true : false,
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    color: const Color(0xff2765cd),
                    Icons.check_circle,
                  ),
                ),
              ),
              ImageIcon(
                AssetImage('${widget.genderIcon}'),
                size: 80,
                color: isChecked == true
                    ? const Color(0xff2765cd)
                    : const Color(0xff888888),
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                  child: Text(
                '${widget.gender}',
                style: TextStyle(fontSize: 22),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
