import 'package:buscar/widgets/background.dart';
import 'package:buscar/widgets/login_form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String appVer = 'a1.0.0';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        body: Center(
            child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Background(),
              Padding(padding: EdgeInsets.only(bottom: 50), child: LoginForm()),
              AppVersion(appVer: appVer)
            ],
          ),
        )),
      ),
    );
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
