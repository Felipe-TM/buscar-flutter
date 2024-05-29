import 'package:flutter/material.dart';

class UnderlineTextField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const UnderlineTextField(
      {super.key, required this.label, this.controller, this.keyboardType});

  @override
  State<UnderlineTextField> createState() => _UnderlineTextFieldState();
}

class _UnderlineTextFieldState extends State<UnderlineTextField> {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).colorScheme.inversePrimary;
    return TextField(
        cursorColor: color,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: color, width: 2.0)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: color, width: 2.0)),
            labelText: widget.label,
            labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.onBackground.withAlpha(180),
              fontSize: 15,
              fontFamily: 'Istok Web',
              fontWeight: FontWeight.w400,
              height: 0.2,
              letterSpacing: 0.80,
            )));
  }
}
