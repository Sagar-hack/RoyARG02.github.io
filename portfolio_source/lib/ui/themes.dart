import 'package:flutter/material.dart';

ThemeData buildLightTheme() {
  ThemeData base = ThemeData.light();
  return base.copyWith(
    buttonBarTheme: base.buttonBarTheme.copyWith(
      buttonTextTheme: ButtonTextTheme.normal,
    ),
  );
}

ThemeData buildDarkTheme() {
  ThemeData base = ThemeData.dark();
  return base.copyWith(
    buttonBarTheme: base.buttonBarTheme.copyWith(
      buttonTextTheme: ButtonTextTheme.normal,
    ),
  );
}