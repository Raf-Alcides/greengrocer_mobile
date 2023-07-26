import 'package:flutter/material.dart';

class UiConfig {
  UiConfig._();

  static String get title => 'GreenGrocer';

  static ThemeData get theme => ThemeData(
        primaryColor: const Color(0xff8bc34a),
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
      );
}
