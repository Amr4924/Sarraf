import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'dart:ui' as ui;
import 'package:sarraf/core/theming/style.dart';
import 'package:sarraf/feature/home/data/currency_rates_model.dart';

class RateInfo extends StatelessWidget {
  final CurrencyRatesModel? data;
  final String selectedCurrencyTo;
  final String selectedCurrencyFrom;
  const RateInfo({
    super.key,
    this.data,
    required this.selectedCurrencyTo,
    required this.selectedCurrencyFrom,
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
                text: "1 ",
                style: TextStyles.font15TextPrimarySemiBold(context),
              ),
              TextSpan(
                text: selectedCurrencyFrom,
                style: TextStyles.font15TextPrimarySemiBold(context),
              ),
              TextSpan(
                text: data == null
                    ? " = -- $selectedCurrencyTo"
                    : " = ${data!.convert(1, selectedCurrencyFrom, selectedCurrencyTo).toStringAsFixed(2)} $selectedCurrencyTo",
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
