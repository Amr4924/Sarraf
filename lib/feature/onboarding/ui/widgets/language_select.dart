import 'package:flutter/widgets.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/core/theming/style.dart';
import 'package:sarraf/core/widgets/app_language_option.dart';

class LanguageSelect extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Language", style: TextStyles.font15TextPrimarySemiBold(context)),
        verticalSpacing(2),
        Text(
          "Choose the app language",
          style: TextStyles.font12ScondaryRegular(context),
        ),
        verticalSpacing(12),
        Row(
          children: [
            Expanded(
              child: AppLanguageOption(
                isSelect: true,
                sympol: "EN",
                label: "English",
                subtitle: "Defult",
                onTap: () {},
              ),
            ),
            horizontalSpacing(10),
            Expanded(
              child: AppLanguageOption(
                isSelect: false,
                sympol: "ع",
                label: "العربية",
                subtitle: "Arabic",
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
