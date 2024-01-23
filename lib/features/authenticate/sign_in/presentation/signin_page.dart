import 'package:flutter/material.dart';

import '../../../../common_widgets/buscar_title.dart';
import '../../../../common_widgets/custom_filled_button.dart';
import '../../../../common_widgets/div.dart';
import '../../../../common_widgets/google_button.dart';
import '../../../../common_widgets/password_text_field.dart';
import '../../../../common_widgets/shrinkeble_button.dart';
import '../../../../common_widgets/underline_text_field.dart';
import '../../email_verification/presentation/email_screen.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 43),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const BuscarTitle(),
                  const UnderlineTextField(label: 'email'),
                  const UnderlineTextField(label: 'username'),
                  const PasswordTextField(label: 'password'),
                  const PasswordTextField(label: 'confirm password'),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ShrinkebleButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EmailScreen(),
                          ),
                        );
                      },
                      child: const CustomFilledButton(
                        chield: Text('Send'),
                      ),
                    ),
                  ),
                  const Div(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ShrinkebleButton(
                      onPressed: () {},
                      child: GoogleButton(
                        onPressed: () {},
                      ),
                    ),
                  )
                ]
                    .map((widget) => Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: widget,
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
