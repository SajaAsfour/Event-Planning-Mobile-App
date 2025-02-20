import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier{

  ThemeMode app_theme = ThemeMode.light;

  void changeTheme( ThemeMode newAppTheme){
    if (newAppTheme == app_theme) return;
    app_theme = newAppTheme;
    notifyListeners();
  }
}