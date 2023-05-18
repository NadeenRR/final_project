import 'package:flutter/material.dart';

import '../constance.dart';

class CorrectQuestion extends StatelessWidget {
  const CorrectQuestion({
    required this.text,
    this.isQuestion = false,
    super.key,
  });
  final bool isQuestion;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
          border: Border.all(color: KPrimaryColor),
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }
}
