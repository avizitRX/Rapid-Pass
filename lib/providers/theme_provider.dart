import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool lightTheme;

  ThemeProvider({
    this.lightTheme = true,
  });

  void changeTheme() {
    lightTheme = !lightTheme;
    notifyListeners();
  }
}
