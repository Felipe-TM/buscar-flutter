import 'package:buscar/Widgets/login_page.dart';
import 'package:flutter/material.dart';

class UnderlineTextField extends StatefulWidget {
  final String label;

  const UnderlineTextField({super.key, required this.label});

  @override
  State<UnderlineTextField> createState() => _UnderlineTextFieldState();
}

class _UnderlineTextFieldState extends State<UnderlineTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: blueColor,
        decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: blueColor, width: 2.0)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: blueColor, width: 2.0)),
            labelText: widget.label,
            labelStyle: const TextStyle(
              color: Color(0xFF898989),
              fontSize: 14,
              fontFamily: 'Istok Web',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 0.80,
            )));
  }
}
