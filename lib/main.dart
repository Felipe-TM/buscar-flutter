import 'package:buscar/Widgets/background.dart';
import 'package:buscar/Widgets/buscar_title.dart';
import 'package:buscar/Widgets/login_form.dart';
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
      home: Stack(
        children: [
          Background(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const BuscarTitle(),
                const LoginForm(),
                Container(
                  alignment: const Alignment(0, 0.6),
                  height: 100,
                  child: Text('Version $appVer',
                      style: const TextStyle(
                        color: Color(0xFF898989),
                        fontSize: 11,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        decoration: TextDecoration.none,
                        letterSpacing: 0.55,
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
