import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/core/routing/routes.dart';
import 'package:sarraf/core/theming/app_colors.dart';
import 'package:sarraf/core/theming/style.dart';

class CustomHomeBar extends StatelessWidget {
  const CustomHomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Color currentGoldTint = isDark
        ? AppColors.dark.goldTint
        : AppColors.light.goldTint;
    Color currentGoldText = isDark
        ? AppColors.dark.goldText
        : AppColors.light.goldText;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tr("title-home-screen"),
              style: TextStyles.font24PrimaryBold(context),
            ),
            Text(
              tr("description-title-home-screen"),
              style: TextStyles.font13ScondaryMedium(context),
            ),
          ],
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: currentGoldTint,
              radius: 22.r,
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.goldTrackingScreen);
                },
                icon: SvgPicture.asset(
                  "assets/svgs/gold_icon.svg",
                  colorFilter: ColorFilter.mode(
                    currentGoldText,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            horizontalSpacing(12),
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.surface,
              radius: 22.r,
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.settingsScreen);
                },
                icon: Icon(
                  Icons.settings,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
