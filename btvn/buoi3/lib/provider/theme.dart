import 'package:flutter/material.dart';

import '../size_config.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData lightTheme(context) => ThemeData.light().copyWith(
      useMaterial3: true,
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: textSize(context, size: 0.075),
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ),
        titleMedium: TextStyle(
          color: Colors.grey,
          fontSize: textSize(context, size: 0.055),
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          color: Colors.orange,
          fontSize: textSize(context, size: 0.055),
          fontWeight: FontWeight.bold,
        ),
      ));
  ThemeData darkTheme(context) => ThemeData.dark().copyWith(
      useMaterial3: true,
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: textSize(context, size: 0.075),
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
        titleMedium: TextStyle(
          color: Colors.white,
          fontSize: textSize(context, size: 0.055),
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          color: Colors.green,
          fontSize: textSize(context, size: 0.055),
          fontWeight: FontWeight.bold,
        ),
      ));

  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void changeTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
