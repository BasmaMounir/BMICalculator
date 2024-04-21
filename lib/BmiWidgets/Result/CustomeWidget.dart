import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  CustomWidget({super.key, required this.title, required this.titleValue});

  String title;
  String titleValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Text(
          titleValue,
          style: const TextStyle(color: Colors.grey, fontSize: 20),
        ),
      ],
    );
  }
}
