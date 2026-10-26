import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/core/theming/style.dart';
import 'package:sarraf/feature/settings/logic/cubit/theme_cubit.dart';
import 'package:sarraf/feature/settings/logic/cubit/theme_state.dart';
import 'package:sarraf/feature/settings/ui/widgets/thme_option.dart';

class Apepearance extends StatefulWidget {
  const Apepearance({super.key});

  @override
  State<Apepearance> createState() => _ApepearanceState();
}

class _ApepearanceState extends State<Apepearance> {
  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "appearance-title".tr(),
          style: TextStyles.font15TextPrimarySemiBold(context),
        ),
        Text(
          "appearance-description".tr(),
          style: TextStyles.font12ScondaryRegular(context),
        ),
        verticalSpacing(14),
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            final bool isLight = state.themeMode == ThemeMode.light;
            final bool isDark = state.themeMode == ThemeMode.dark;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12.w,
              children: [
                Expanded(
                  child: ThemeOption(
                    assetPath: "assets/svgs/light.svg",
                    icon: Icons.wb_sunny_outlined,
                    label: "theme-light".tr(),
                    selected: isLight,
                    onChanged: (value) {
                      if (value == true) {
                        themeCubit.toggleTheme(false);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: ThemeOption(
                    assetPath: "assets/svgs/dark.svg",
                    icon: Icons.dark_mode_outlined,
                    label: "theme-dark".tr(),
                    selected: isDark,
                    onChanged: (value) {
                      if (value == true) {
                        themeCubit.toggleTheme(true);
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
