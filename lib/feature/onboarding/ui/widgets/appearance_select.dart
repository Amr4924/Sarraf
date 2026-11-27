import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:material_ui/material_ui.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/core/theming/style.dart';
import 'package:sarraf/core/widgets/app_thme_option.dart';

class AppearanceSelect extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Appearance",
          style: TextStyles.font15TextPrimarySemiBold(context),
        ),
        verticalSpacing(2),
        Text(
          "Choose a theme or follow your device",
          style: TextStyles.font12ScondaryRegular(context),
        ),
        verticalSpacing(12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12.w,
          children: [
            Expanded(
              child: ThemeOption(
                assetPath: "assets/svgs/light.svg",
                icon: Icons.wb_sunny_outlined,
                label: "Light",
                selected: false,
                onTap: () {},
              ),
            ),
            Expanded(
              child: ThemeOption(
                assetPath: "assets/svgs/dark.svg",
                icon: Icons.dark_mode_outlined,
                label: "Dark",
                selected: true,
                onTap: () {},
              ),
            ),
            Expanded(
              child: ThemeOption(
                assetPath: "assets/svgs/System.svg",
                icon: Icons.smartphone,
                label: "System",
                selected: false,
                onTap: () {},
              ),
            ),
          ],
        ),
        verticalSpacing(12),
        Text(
          "Following your device · currently Dark",
          style: TextStyles.font12ScondaryRegular(context),
        ),
      ],
    );
  }
}
