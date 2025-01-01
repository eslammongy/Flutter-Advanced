import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkTheme = true;

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme(ThemeMode mode) {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  ThemeMode get themeMode {
    return _isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  }
}
