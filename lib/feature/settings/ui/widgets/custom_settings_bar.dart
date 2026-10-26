import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/core/theming/style.dart';

class CustomSettingsBar extends StatelessWidget {
  const CustomSettingsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        horizontalSpacing(16),
        Text(
          tr("title-settings-screen"),
          style: TextStyles.font24PrimaryBold(context),
        ),
      ],
    );
  }
}
