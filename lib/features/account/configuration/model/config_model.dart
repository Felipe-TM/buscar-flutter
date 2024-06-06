import 'package:flutter/material.dart';

class ConfigurationModel extends ChangeNotifier {
  final String appVer = 'a1.0.0';
  late bool themeMode = true;

  get getThemeMode => themeMode;

  set setThemeMode(bool themeMode) {
    this.themeMode = themeMode;
    notifyListeners();
  }
}
