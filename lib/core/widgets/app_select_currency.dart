import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:material_ui/material_ui.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/core/models/currencies_model.dart';
import 'package:sarraf/core/theming/style.dart';

class AppSelectCurrency extends StatelessWidget {
  double? width;
  double? height;
  EdgeInsetsGeometry? padding;
  BorderRadiusGeometry? borderRadius;
  String? symbol;
  String? currencyName;
  String? code;
  AppSelectCurrency({
    super.key,
    this.borderRadius,
    this.height,
    this.padding,
    this.width,
    this.symbol,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final initialCurrency = currenciesList[0];
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 300.h,
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: currenciesList.length,
                itemBuilder: (context, index) {
                  final currency = currenciesList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: colorScheme.primary,
                      child: Text(
                        currency.symbol,
                        style: TextStyles.font14OnPrimaryBold(context),
                      ),
                    ),
                    title: Text(
                      currency.code,
                      style: TextStyles.font15TextPrimarySemiBold(context),
                    ),
                    subtitle: Text(
                      currency.nameCurrencies,
                      style: TextStyles.font12ScondaryRegular(context),
                    ),

                    onTap: () {
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            );
          },
        );
      },
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 64.w,
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: borderRadius ?? BorderRadius.circular(18.r),
          border: Border.all(color: colorScheme.outline),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: colorScheme.primary,
              child: Text(
                symbol ?? initialCurrency.symbol,
                style: TextStyles.font14OnPrimaryBold(context),
              ),
            ),
            horizontalSpacing(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currencyName ?? initialCurrency.nameCurrencies,
                  style: TextStyles.font15TextPrimarySemiBold(context),
                ),
                Expanded(
                  child: Text(
                    code ?? initialCurrency.code,
                    style: TextStyles.font12ScondaryRegular(context),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Expanded(child: Icon(Icons.chevron_right)),
          ],
        ),
      ),
    );
  }
}
