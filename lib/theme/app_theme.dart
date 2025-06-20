
import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData theme = ThemeData(
    fontFamily: "Comfortaa",
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.white)
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color.fromARGB(126, 255, 255, 255),
      hintStyle: TextStyle(
        color: Color(0xFFEBEBEB)
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide.none
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        textStyle: WidgetStatePropertyAll(TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold
        )),
      )
    )
  );
}