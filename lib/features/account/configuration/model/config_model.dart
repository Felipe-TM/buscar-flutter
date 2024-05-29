import 'package:flutter/material.dart';

class ConfigurationModel extends ChangeNotifier {
  late bool themeMode = true;

  get getThemeMode => this.themeMode;

  set setThemeMode(bool themeMode) {
    this.themeMode = themeMode;
    notifyListeners();
  }
}
