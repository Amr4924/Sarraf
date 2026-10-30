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
  final Color goldBase;
  final Color goldOnBase;
  final Color goldTint;
  final Color goldText;
  final Color stateNegative;
  final Color stateNegativeTint;
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
    required this.goldBase,
    required this.goldOnBase,
    required this.goldTint,
    required this.goldText,
    required this.stateNegative,
    required this.stateNegativeTint,
  });

  static final light = AppColors(
    background: Color(0xffF4F7F6),
    surface: Color(0xffFFFFFF),
    muted: Color(0xffE8EEEB), //
    borderDefault: Color(0xffDDE5E1), //
    textPrimary: Color(0xff0E1A16), //
    textSecondary: Color(0xff52645C), //
    textTertiary: Color(0xff7F8F88), //
    brandPrimary: Color(0xff0A7D61), //
    brandOnPrimary: Color(0xffFFFFFF), //
    brandTint: Color(0xffDDF1EA), //
    goldBase: Color(0xffE0AE2F),
    goldOnBase: Color(0xff2B1E00),
    goldTint: Color(0xffFBF1D6),
    goldText: Color(0xff8A5D00),
    stateNegative: Color(0xffC93C3C),
    stateNegativeTint: Color(0xffFBE4E4),
  );

  static final dark = AppColors(
    background: Color(0xff0B1210), //
    surface: Color(0xff141D1A), //
    muted: Color(0xff1E2A26), //
    borderDefault: Color(0xff26332F), //
    textPrimary: Color(0xffEAF3EF), //
    textSecondary: Color(0xff9DB0A8), //
    textTertiary: Color(0xff6E827A), //
    brandPrimary: Color(0xff34D399), //
    brandOnPrimary: Color(0xff04261B), //
    brandTint: Color(0xff11332A), //

    goldBase: Color(0xffF0C14B),
    goldOnBase: Color(0xff2B1E00),
    goldTint: Color(0xff2E2610),
    goldText: Color(0xffF0C14B),
    stateNegative: Color(0xffFF8A80),
    stateNegativeTint: Color(0xff3A1A1A),
  );
}
