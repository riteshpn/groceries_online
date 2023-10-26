import 'package:flutter/material.dart';
import 'package:groceries_online/services/dark_theme_prefs.dart';

class DarkThemeProvider with ChangeNotifier {
  DartThemePerfs darkThemePrefs = DartThemePerfs();
  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    darkThemePrefs.setDarkTheme(value);
    notifyListeners();
  }
}
