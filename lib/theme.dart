import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class myTheme {
  static const mainColor = Color(0xFF232323);
  static const mainDarker = Color.fromRGBO(23, 20, 20, 1.0);
  static const whiteGrey = Color.fromRGBO(244, 243, 243, 1);
  static const teal = Color(0xFFF0A04B);
  static final lightTheme = ThemeData(
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)))),
      primaryColor: Colors.white,
      accentColor: Colors.black,
      scaffoldBackgroundColor: whiteGrey,
      drawerTheme: const DrawerThemeData(),
      textTheme: TextTheme(
        headline6: TextStyle(fontSize: 18, color: Colors.black87),
        headline5: TextStyle(fontSize: 22, color: Colors.black87),
      ),
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: mainColor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ));
  static final darkTheme = ThemeData(
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)))),
      scaffoldBackgroundColor: mainColor,
      textTheme: TextTheme(
          headline6: TextStyle(fontSize: 18, color: Colors.white),
          headline5: TextStyle(fontSize: 22, color: Colors.white),
          subtitle2: TextStyle(fontSize: 15, color: Colors.white)),
      appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: mainColor,
        unselectedItemColor: Colors.grey,
        elevation: 0,
        backgroundColor: Colors.red,
      ));
}
