import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier {
  ThemeMode _appThemeMode;
  // detect theme the first time, change later according to user
  AppTheme() : _appThemeMode = ThemeMode.system;

  ThemeMode get appThemeMode => _appThemeMode;

  void toggleThemeMode(BuildContext context) {
    _appThemeMode = isDarkTheme(context) ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  bool isDarkTheme(BuildContext context) {
    return _appThemeMode == ThemeMode.dark ||
        (_appThemeMode == ThemeMode.system &&
            MediaQuery.platformBrightnessOf(context) == ui.Brightness.dark);
  }
}
