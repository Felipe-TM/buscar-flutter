import 'package:buscar/common_widgets/buscar_title.dart';
import 'package:buscar/common_widgets/custom_filled_button.dart';
import 'package:buscar/common_widgets/password_text_field.dart';
import 'package:buscar/common_widgets/shrinkeble_button.dart';
import 'package:buscar/common_widgets/underline_text_field.dart';
import 'package:buscar/features/authenticate/sign_in/presentation/signin_page.dart';
import 'package:buscar/features/rides/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';

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
                child: const CustomFilledButton(
                  child: Text('Login'),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
              ),
            ),
            const SignInButton(),
          ]
              .map(
                (widget) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: widget,
                ),
              )
              .toList(),
        ),
      ),
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignInPage(),
          ),
        ),
      },
      child: Text(
        'Sign In',
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            decoration: TextDecoration.underline,
            decorationColor: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
