import 'package:buscar/widgets/background.dart';
import 'package:buscar/widgets/buscar_title.dart';
import 'package:buscar/widgets/signin_page.dart';
import 'package:flutter/material.dart';

import 'Login/custom_filled_button.dart';
import 'Login/div.dart';
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
              const PasswordTextField(label: 'password'),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ShrinkebleButton(
                    child: const CustomFilledButton(chield: Text('Login')),
                    onPressed: () {
                      print('teste');
                    }),
              ),
              const SignInButton(),
              const Div(),
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
        onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInPage()))
            },
        child: Text(
          'Sign In',
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              decoration: TextDecoration.underline,
              decorationColor: Theme.of(context).colorScheme.primary),
        ));
  }
}

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
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground.withAlpha(180),
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
