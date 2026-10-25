import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sarraf/core/theming/text_weight.dart';

class TextStyles {
  static TextStyle font32PrimaryBold(BuildContext context) => GoogleFonts.cairo(
    fontSize: 32.sp,
    fontWeight: TextWeightHelper.bold,
    color: Theme.of(context).colorScheme.onSurface,
  );
  static TextStyle font24PrimaryBold(BuildContext context) => GoogleFonts.cairo(
    fontSize: 24.sp,
    fontWeight: TextWeightHelper.bold,
    color: Theme.of(context).colorScheme.onSurface,
  );
  static TextStyle font13ScondaryMedium(BuildContext context) =>
      GoogleFonts.cairo(
        fontSize: 13.sp,
        fontWeight: TextWeightHelper.medium,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      );
  static TextStyle font12ScondaryRegular(BuildContext context) =>
      GoogleFonts.cairo(
        fontSize: 12.sp,
        fontWeight: TextWeightHelper.regular,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      );
  static TextStyle font14OnPrimaryBold(BuildContext context) =>
      GoogleFonts.cairo(
        fontSize: 14.sp,
        fontWeight: TextWeightHelper.bold,
        color: Theme.of(context).colorScheme.onPrimary,
      );
  static TextStyle font16TextPrimarySemiBold(BuildContext context) =>
      GoogleFonts.cairo(
        fontSize: 16.sp,
        fontWeight: TextWeightHelper.semiBold,
        color: Theme.of(context).colorScheme.onSurface,
      );
}
