import 'package:buscar/Widgets/background.dart';
import 'package:buscar/widgets/buscar_title.dart';
import 'package:flutter/material.dart';

import 'Login/custom_filled_button.dart';
import 'Login/shrinkeble_button.dart';
import 'Login/google_button.dart';
import 'Login/password_text_field.dart';
import 'Login/underline_text_field.dart';

const Color blueColor = Color(0xFF1BC2F7);
const Color lightGray = Color(0xFF898989);

class LoginPage extends StatelessWidget {
  final String appVer;

  const LoginPage({super.key, required this.appVer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Background(),
            const Padding(
                padding: EdgeInsets.only(bottom: 50), child: LoginForm()),
            AppVersion(appVer: appVer)
          ],
        ),
      )),
    );
  }
}

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
      height: 550,
      width: 250,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const BuscarTitle(),
              const UnderlineTextField(label: 'username'),
              const PasswordTextField(label: 'password', obsureText: true),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: ShrinkebleButton(
                    child: CustomFilledButton(chield: Text('Login')),
                    onPressed: () {
                      print('teste');
                    }),
              ),
              const SignInButton(),
              div,
              GoogleButton(
                onPressed: () {
                  print('google');
                },
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

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => {},
        child: Text(
          'Sign In',
          style: TextStyle(
              color: Colors.blue[800],
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue[800]),
        ));
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

class AppVersion extends StatelessWidget {
  const AppVersion({
    super.key,
    required this.appVer,
  });

  final String appVer;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, 0.6),
      height: 30,
      child: Text('Version $appVer',
          style: const TextStyle(
            color: Color(0xFF898989),
            fontSize: 12,
            fontFamily: 'Kanit',
            fontWeight: FontWeight.w600,
            height: 0,
            decoration: TextDecoration.none,
            letterSpacing: 0.55,
          )),
    );
  }
}
