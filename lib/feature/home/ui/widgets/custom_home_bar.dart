import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/core/routing/routes.dart';
import 'package:sarraf/core/theming/style.dart';

class CustomHomeBar extends StatelessWidget {
  const CustomHomeBar({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
