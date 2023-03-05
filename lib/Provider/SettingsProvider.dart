import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsProvider extends ChangeNotifier{
  ThemeMode currentTheme=ThemeMode.light;
  String currentLang='en';
  void setTheme(ThemeMode theme){
    currentTheme=theme;
    notifyListeners();
  }
  void setLang(String lang){
    currentLang=lang;
    notifyListeners();
  }

}