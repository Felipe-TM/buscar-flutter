import 'package:buscar/Widgets/login_page.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final String label;
  final bool obsureText;

  const PasswordTextField(
      {super.key, required this.label, required this.obsureText});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obsureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: _obsureText,
        decoration: InputDecoration(
            suffix: InkWell(
              onTap: _togglePasswordView,
              child: Icon(
                color: Colors.black38,
                _obsureText ? Icons.visibility : Icons.visibility_off,
              ),
            ),
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

  void _togglePasswordView() {
    setState(() {
      _obsureText = !_obsureText;
    });
  }
}
