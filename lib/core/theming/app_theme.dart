import 'package:flutter/material.dart';
import 'package:sarraf/core/theming/app_colors.dart';

class AppTheme {
  AppColors colorsLight = AppColors.light;
  AppColors colorsDark = AppColors.light;
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.light.background,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      surface: AppColors.light.surface,
      primary: AppColors.light.brandPrimary,
      onPrimary: AppColors.light.brandOnPrimary,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.dark.background,
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      surface: AppColors.dark.surface,
      primary: AppColors.dark.brandPrimary,
      onPrimary: AppColors.dark.brandOnPrimary,
    ),
  );
}
