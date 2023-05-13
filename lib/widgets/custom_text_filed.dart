// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../constance.dart';

class CustomTextFiled extends StatefulWidget {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String labelText, text;
  final Color backgroundColor;
  final String? Function(String?) validator;
  final void Function(String)? onChanged;

  CustomTextFiled({
    super.key,
    required TextEditingController controller,
    required this.labelText,
    required this.text,
    required this.backgroundColor,
    required this.validator,
    required this.onChanged,
  });

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      cursorColor: Colors.teal,
      decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.grey),
          border: buildBorder(Colors.teal),
          focusedBorder: buildBorder(Colors.teal),
          labelText: widget.labelText,
          icon: CircleAvatar(
            backgroundColor: widget.backgroundColor,
            child: Text(
              widget.text,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          )),
    );
  }
}
