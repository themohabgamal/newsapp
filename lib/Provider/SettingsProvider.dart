import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsProvider extends ChangeNotifier{
  ThemeMode currentTheme=ThemeMode.light;
  void setTheme(ThemeMode theme){
    currentTheme=theme;
        notifyListeners();
  }

}