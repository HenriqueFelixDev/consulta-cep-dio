import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    final defaultInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(100.0),
      borderSide: const BorderSide(color: Color(0xFF8A93DC)),
    );

    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF2637CD),
        error: const Color(0xFFC91A1A),
        onError: Colors.white,
      ),
      textTheme: GoogleFonts.muktaTextTheme(),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: const StadiumBorder(),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        enabledBorder: defaultInputBorder,
        border: defaultInputBorder,
      ),
    );
  }
}
