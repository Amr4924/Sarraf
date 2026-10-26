import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/core/theming/style.dart';

class AppField extends StatelessWidget {
  final Color? color;
  final String selectedCurrency;
  final String nameCurrency;
  final String symbol;
  final String? title;
  final Widget? widget;
  final TextEditingController? controller;
  final bool? autofocus;
  final void Function()? onTap;
  const AppField({
    super.key,
    this.color,
    required this.selectedCurrency,
    required this.nameCurrency,
    required this.symbol,
    this.onTap,
    this.title,
    this.controller,
    this.widget,
    this.autofocus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140.h,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: color ?? Theme.of(context).colorScheme.primary,
          width: 2.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "currency-from".tr(),
            style: TextStyles.font13ScondaryMedium(context),
          ),
          verticalSpacing(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 112.w,
                  height: 44.h,
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        radius: 16.r,
                        child: Text(
                          symbol,
                          style: TextStyles.font14OnPrimaryBold(context),
                        ),
                      ),
                      horizontalSpacing(8),
                      Text(selectedCurrency),
                      Expanded(child: Icon(Icons.keyboard_arrow_down)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 50,
                      maxWidth: 150,
                    ),
                    child:
                        widget ??
                        TextField(
                          autofocus: autofocus ?? false,
                          controller: controller,
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "0.0",
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                  ),
                ),
              ),
            ],
          ),
          verticalSpacing(8),
          Text(nameCurrency, style: TextStyles.font12ScondaryRegular(context)),
        ],
      ),
    );
  }
}
