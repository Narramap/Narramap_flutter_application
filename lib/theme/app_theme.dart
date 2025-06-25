
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
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        textStyle: WidgetStatePropertyAll(TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: "Comfortaa"
        )),
      )
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return Color(0xFFF2F2F2);
        return Color(0xFF5B5B5B);
      }),
      trackColor: WidgetStateColor.resolveWith((states) {
        if(states.contains(WidgetState.selected)) return Color(0xFF5B5B5B);
        return Color(0xFFF2F2F2);
      })
    )
  );
}