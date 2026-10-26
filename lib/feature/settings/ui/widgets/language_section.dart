import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/core/theming/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sarraf/feature/settings/ui/widgets/language_option.dart';

class LanguageSection extends StatefulWidget {
  const LanguageSection({super.key});

  @override
  State<LanguageSection> createState() => _LanguageSectionState();
}

class _LanguageSectionState extends State<LanguageSection> {
  bool get isEnglish => context.locale.languageCode == "en";
  bool get isArabic => context.locale.languageCode == "ar";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "language-title".tr(),
          style: TextStyles.font15TextPrimarySemiBold(context),
        ),
        verticalSpacing(2),
        Text(
          "language-description".tr(),
          style: TextStyles.font12ScondaryRegular(context),
        ),
        verticalSpacing(15),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(22.r),
          ),
          child: Column(
            children: [
              LanguageOption(
                title: "language-english",
                subtitle: "language-default",
                code: "EN",
                value: isEnglish,
                onChanged: (value) {
                  if (value == true) {
                    context.setLocale(Locale('en', 'US'));
                  }
                },
              ),

              Divider(),
              LanguageOption(
                code: "ع",
                title: "language-arabic",
                subtitle: "language-arabic",
                onChanged: (value) {
                  if (value == true) {
                    context.setLocale(Locale('ar', 'EG'));
                  }
                },
                value: isArabic,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
