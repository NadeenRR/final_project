import 'package:flutter/material.dart';

import '../constance.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.heightButton,
      required this.widthButton,
      required this.text,
      required this.onTap});
  final double heightButton;
  final double widthButton;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: heightButton,
        width: widthButton,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: KPrimaryColor, borderRadius: BorderRadius.circular(8)),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
