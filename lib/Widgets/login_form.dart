import 'package:flutter/material.dart';

const Color blueColor = Color(0xFF1BC2F7);

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 250,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const CustomTextField(label: 'username'),
              const CustomTextField(label: 'password'),
              const Padding(
                padding: EdgeInsets.only(top: 25),
                child: LoginButton(),
              ),
              TextButton(
                  onPressed: () => {},
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.blue[800],
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue[800]),
                  ))
            ]
                .map((widget) => Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: widget,
                    ))
                .toList(),
          )),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;

  const CustomTextField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: blueColor, width: 2.0)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: blueColor, width: 2.0)),
            labelText: label,
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

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<StatefulWidget> createState() => _LoginButton();
}

class _LoginButton extends State<LoginButton> {
  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: const ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius:
                  BorderRadiusDirectional.all(Radius.circular(10.0)))),
          fixedSize: MaterialStatePropertyAll(Size(125, 50)),
          backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFF7ACFFF))),
      child: const Text('Login'),
    );
  }
}
