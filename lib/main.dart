import 'package:buscar/features/account/account_details/repository/account_repository.dart';
import 'package:buscar/features/account/configuration/model/config_model.dart';
import 'package:buscar/features/authenticate/login/presentation/login_screen.dart';
import 'package:buscar/features/rides/ride_repository/ride_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ConfigurationModel>(
          create: (BuildContext context) {
            return ConfigurationModel();
          },
        ),
        ChangeNotifierProvider<AccountRepository>(
          create: (BuildContext context) {
            return FakeAccRepo();
          },
        ),
        ChangeNotifierProvider<RideRepository>(
          create: (BuildContext context) {
            return FakeRideRepo();
          },
        ),
      ],
      child: Consumer<ConfigurationModel>(
        builder:
            (BuildContext context, ConfigurationModel model, Widget? child) {
          return MaterialApp(
            title: 'Buscar Alpha Test',
            debugShowCheckedModeBanner: false,
            home: LoginScreen(appVer: model.appVer),
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
