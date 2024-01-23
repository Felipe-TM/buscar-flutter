import 'package:flutter/material.dart';

import '../../../../common_widgets/app_version.dart';
import 'login_background.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  final String appVer;

  const LoginScreen({super.key, required this.appVer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              const Background(),
              const Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: LoginForm(),
              ),
              AppVersion(appVer: appVer)
            ],
          ),
        ),
      ),
    );
  }
}
