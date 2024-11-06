import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const ColorSwatch green = MaterialColor(
    0xFF87A922,
    <int, Color>{
      50: Color(0xFFDBEDA4),
      100: Color(0xFFD3E991),
      200: Color(0xFFC5E26D),
      300: Color(0xFFB6DB48),
      400: Color(0xFFA5CF29),
      500: Color(0xFF87A922),
      600: Color(0xFF7E9E1F),
      700: Color(0xFF75921D),
      800: Color(0xFF6B861A),
      900: Color(0xFF617A18),
    },
  );
  static const Color primary = green;
}