import 'package:flutter/material.dart';

class AppColors {
  final Color background;
  final Color surface;
  final Color muted;
  final Color borderDefault;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color brandPrimary;
  final Color brandOnPrimary;
  final Color brandTint;
  const AppColors({
    required this.background,
    required this.surface,
    required this.muted,
    required this.borderDefault,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.brandPrimary,
    required this.brandOnPrimary,
    required this.brandTint,
  });

  static final light = AppColors(
    background: Color(0xffF4F7F6),
    surface: Color(0xffFFFFFF),
    muted: Color(0xffE8EEEB),
    borderDefault: Color(0xffDDE5E1),
    textPrimary: Color(0xff0E1A16),
    textSecondary: Color(0xff52645C),
    textTertiary: Color(0xff7F8F88),
    brandPrimary: Color(0xff0A7D61),
    brandOnPrimary: Color(0xffFFFFFF),
    brandTint: Color(0xffDDF1EA),
  );

  static final dark = AppColors(
    background: Color(0xff0B1210),
    surface: Color(0xff141D1A),
    muted: Color(0xff1E2A26),
    borderDefault: Color(0xff26332F),
    textPrimary: Color(0xffEAF3EF),
    textSecondary: Color(0xff9DB0A8),
    textTertiary: Color(0xff6E827A),
    brandPrimary: Color(0xff34D399),
    brandOnPrimary: Color(0xff04261B),
    brandTint: Color(0xff11332A),
  );
}
