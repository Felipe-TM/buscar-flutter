import 'package:buscar/widgets/buscar_title.dart';
import 'package:flutter/material.dart';

const Color blueColor = Color(0xFF1BC2F7);
const Color lightGray = Color(0xFF898989);

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
    return SizedBox(
      height: 500,
      width: 250,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const BuscarTitle(),
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
                  )),
              div,
              Container(
                decoration: const ShapeDecoration(
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.all(
                            Radius.circular(10.0)))),
                child: FilledButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.all(
                              Radius.circular(10.0)))),
                      fixedSize: MaterialStatePropertyAll(Size(125, 50)),
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.white)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('lib/assets/google.png'),
                      const Text(
                        'Google',
                        style: TextStyle(
                          color: Color(0xFF6A6969),
                          fontSize: 13,
                          fontFamily: 'Istok Web',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 0.80,
                        ),
                      )
                    ],
                  ),
                ),
              )
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
    return Container(
      decoration: const ShapeDecoration(
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadiusDirectional.all(Radius.circular(10.0)))),
      child: FilledButton(
        onPressed: onPressed,
        style: const ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius:
                    BorderRadiusDirectional.all(Radius.circular(10.0)))),
            fixedSize: MaterialStatePropertyAll(Size(125, 50)),
            backgroundColor:
                MaterialStatePropertyAll<Color>(Color(0xFF7ACFFF))),
        child: const Text('Login'),
      ),
    );
  }
}

var div = SizedBox(
  width: 340,
  height: 20,
  child: Stack(
    alignment: AlignmentDirectional.center,
    children: [
      const Center(
        child: Text(
          'or',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF757575),
            fontSize: 14,
            fontFamily: 'Istok Web',
            fontWeight: FontWeight.w400,
            height: 0,
            letterSpacing: 0.70,
          ),
        ),
      ),
      Positioned(
        left: 0,
        top: 10,
        child: Container(
          width: 100,
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: Color(0xFFD9D9D9),
              ),
            ),
          ),
        ),
      ),
      Positioned(
        left: 150,
        top: 10,
        child: Container(
          width: 100,
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: Color(0xFFD9D9D9),
              ),
            ),
          ),
        ),
      ),
    ],
  ),
);
