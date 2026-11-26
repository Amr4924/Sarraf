import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import 'dart:ui' as ui;

import 'package:sarraf/core/theming/style.dart';

class RateInfo extends StatelessWidget {
  final String selectedCurrencyTo;
  final String selectedCurrencyFrom;
  final bool isLoding;
  final double rates;
  const RateInfo({
    super.key,
    required this.selectedCurrencyTo,
    required this.selectedCurrencyFrom,
    required this.isLoding,
    required this.rates,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 270.w,
        height: 38.h,
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(999.r),
        ),
        child: RichText(
          textDirection: ui.TextDirection.ltr,
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "1 $selectedCurrencyFrom = ",
                style: TextStyles.font15TextPrimarySemiBold(context),
              ),
              if (isLoding)
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: SizedBox(
                    width: 14.w,
                    height: 14.h,
                    child: CircularProgressIndicator(),
                  ),
                )
              else
                TextSpan(
                  text: " ${rates.toStringAsFixed(2)}  ",
                  style: TextStyles.font15TextPrimarySemiBold(context),
                ),
              TextSpan(
                text: " $selectedCurrencyTo",
                style: TextStyles.font15TextPrimarySemiBold(context),
              ),
              TextSpan(
                text: "     ${"updated-just-now".tr()}",
                style: TextStyles.font12ScondaryRegular(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
