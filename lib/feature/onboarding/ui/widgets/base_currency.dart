import 'package:flutter/widgets.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/core/theming/style.dart';
import 'package:sarraf/core/widgets/app_select_currency.dart';

class BaseCurrency extends StatelessWidget {
  const BaseCurrency({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Base currency",
          style: TextStyles.font15TextPrimarySemiBold(context),
        ),
        Text(
          "Your default currency in the converter",
          style: TextStyles.font12ScondaryRegular(context),
        ),
        verticalSpacing(12),
        AppSelectCurrency(),
      ],
    );
  }
}
