import 'package:buscar/features/account/configuration/model/config_model.dart';
import 'package:buscar/features/authenticate/login/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String appVer = 'a1.0.0';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ConfigurationModel>(
      create: (BuildContext context) {
        return ConfigurationModel();
      },
      child: Consumer<ConfigurationModel>(
        builder:
            (BuildContext context, ConfigurationModel model, Widget? child) {
          return MaterialApp(
            title: 'Buscar Alpha Test',
            home: LoginScreen(appVer: appVer),
            theme: model.getThemeMode
                ? ThemeData(
                    fontFamily: 'Istok Web',
                    colorScheme: ColorScheme.fromSeed(
                      seedColor: const Color.fromARGB(255, 219, 238, 253),
                      brightness: Brightness.dark,
                    ),
                  )
                : ThemeData(
                    fontFamily: 'Istok Web',
                    colorScheme: ColorScheme.fromSeed(
                      seedColor: const Color.fromARGB(255, 219, 238, 253),
                      brightness: Brightness.light,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
