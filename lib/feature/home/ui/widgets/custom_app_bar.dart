import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/core/theming/style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

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
            onPressed: () {},
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
