import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final String label;

  const PasswordTextField({super.key, required this.label});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obsureText = true;

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).colorScheme.inversePrimary;
    return TextField(
        obscureText: _obsureText,
        decoration: InputDecoration(
            suffix: InkWell(
              onTap: _togglePasswordView,
              child: Icon(
                color:
                    Theme.of(context).colorScheme.onBackground.withAlpha(180),
                _obsureText ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: color, width: 2.0)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: color, width: 2.0)),
            labelText: widget.label,
            labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.onBackground.withAlpha(180),
              fontSize: 14,
              fontFamily: 'Istok Web',
              fontWeight: FontWeight.w400,
              height: 0.2,
              letterSpacing: 0.80,
            )));
  }

  void _togglePasswordView() {
    setState(() {
      _obsureText = !_obsureText;
    });
  }
}
