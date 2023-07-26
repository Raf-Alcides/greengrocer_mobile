import 'package:flutter/material.dart';

class UiConfig {
  UiConfig._();

  static String get title => 'GreenGrocer';

  static ThemeData get theme => ThemeData(
        primaryColor: const Color(0xff8bc34a),
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Color(0xff8bc34a),
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            borderSide: BorderSide(color: Color(0xff8bc34a), width: 2),
          ),
          prefixIconColor: Color(0xff8bc34a),
          suffixIconColor: Color(0xff8bc34a),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor:  const Color(0xff8bc34a),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withAlpha(100)
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true
        )
      );
}
