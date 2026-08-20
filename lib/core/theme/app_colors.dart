import 'package:flutter/material.dart';

class AppColors {
  // Brand Color 1
  static const MaterialColor primary = MaterialColor(0xFF50C1C1, <int, Color>{
    20: Color(0xCC50C1C1), // 20%
    40: Color(0x6650C1C1), // 40%
    60: Color(0x9950C1C1), // 60%
    80: Color(0xCC50C1C1), // 80%
  });

  // Brand Color 2
  static const MaterialColor secondary = MaterialColor(0xFFF4B1D8, <int, Color>{
    20: Color(0x33F4B1D8),
    40: Color(0x66F4B1D8),
    60: Color(0x99F4B1D8),
    80: Color(0xCCF4B1D8),
  });

  // Brand Color 3
  static const MaterialColor tertiary = MaterialColor(0xFF9EBBCB, <int, Color>{
    20: Color(0x339EBBCB),
    40: Color(0x669EBBCB),
    60: Color(0x999EBBCB),
    80: Color(0xCC9EBBCB),
  });

  static const Color border = Color(0xFFDEDEDE);
}
