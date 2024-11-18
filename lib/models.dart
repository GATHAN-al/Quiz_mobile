import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light(); // Default theme

  ThemeData get themeData => _themeData;

  void setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
}

class FontNotifier extends ChangeNotifier {
  String _fontFamily = 'Roboto'; // Default font

  String get fontFamily => _fontFamily;

  // Method untuk mengganti font dengan nama font yang dipilih
  void setFont(String fontFamily) {
    _fontFamily = fontFamily;
    notifyListeners();
  }

  // Method untuk mendapatkan TextStyle berdasarkan font yang dipilih
  TextStyle get textStyle => TextStyle(fontFamily: _fontFamily);
}
