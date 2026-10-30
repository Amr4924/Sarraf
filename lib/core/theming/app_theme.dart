import 'package:flutter/material.dart';
import 'package:sarraf/core/theming/app_colors.dart';

class AppTheme {
  AppColors colorsLight = AppColors.light;
  AppColors colorsDark = AppColors.dark;
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.light.background,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      surface: AppColors.light.surface,
      onPrimary: AppColors.light.brandOnPrimary,
      onSurface: AppColors.light.textPrimary,
      onSurfaceVariant: AppColors.light.textSecondary,
      outline: AppColors.light.borderDefault,
      primary: AppColors.light.brandPrimary,
      primaryContainer: AppColors.light.brandTint,
    ),
    dividerColor: AppColors.light.borderDefault,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.dark.background,
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      surface: AppColors.dark.surface,
      onPrimary: AppColors.dark.brandOnPrimary,
      onSurface: AppColors.dark.textPrimary,
      onSurfaceVariant: AppColors.dark.textSecondary,
      outline: AppColors.dark.borderDefault,
      primary: AppColors.dark.brandPrimary,
      primaryContainer: AppColors.dark.brandTint,
    ),
    dividerColor: AppColors.dark.borderDefault,
  );
}
