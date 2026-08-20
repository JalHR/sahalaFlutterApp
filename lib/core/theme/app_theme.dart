import 'package:flutter/material.dart';
import 'package:sahala/core/theme/app_colors.dart';

class AppTheme {
  static const Color _primaryColor = AppColors.primary;
  static const Color _secondaryColor = AppColors.secondary;
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _primaryColor,
      onPrimary: Color(0x001e1e1e),
      secondary: _secondaryColor,
      onSecondary: _primaryColor,
      error: Color(0xFFFF5F57),
      onError: Colors.white,

      surface: Colors.white,
      onSurface: Color(0xFF1E1E1E),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: AppColors.primary),
      ),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,

      primary: _primaryColor,
      onPrimary: Colors.white,

      secondary: _secondaryColor,
      onSecondary: Colors.white,

      error: Color(0xFFFF5F57),
      onError: Colors.white,

      surface: Color(0xFF1E1E1E),
      onSurface: Colors.white,
    ),
  );
}
