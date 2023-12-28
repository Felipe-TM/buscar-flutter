import 'package:flutter/material.dart';
import 'widgets/login_page.dart';

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
        home: LoginPage(appVer: appVer),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 219, 238, 253),
            brightness: Brightness.light,
          ),
        ));
  }
}
