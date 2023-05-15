import 'package:flutter/material.dart';

const MaterialColor KPrimaryColor = Colors.teal;

AppBar customAppBar(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    backgroundColor: KPrimaryColor,
  );
}

OutlineInputBorder buildBorder(color) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color));
}

InputDecoration inputDecoration(
    String labelText, String text, Color backgroundColor) {
  return InputDecoration(
      labelStyle: const TextStyle(color: Colors.grey),
      border: buildBorder(Colors.teal),
      focusedBorder: buildBorder(Colors.teal),
      labelText: labelText,
      icon: CircleAvatar(
        backgroundColor: backgroundColor,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ));
}

Container containerTrue(String text) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    margin: const EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
        color: Colors.green, borderRadius: BorderRadius.circular(8)),
    child: Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}

Container containerFalse(String text) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    margin: const EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(8)),
    child: Text(
      text,
      style: const TextStyle(color: Colors.black, fontSize: 20),
    ),
  );
}

InkWell answerContainer(String answer, Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10 ,vertical: 6),
      decoration: BoxDecoration(
          border: Border.all(color: KPrimaryColor),
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        answer,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    ),
  );
}
