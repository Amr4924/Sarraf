import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/core/theming/style.dart';
import 'package:sarraf/feature/settings/ui/widgets/apperance.dart';
import 'package:sarraf/feature/settings/ui/widgets/custom_settings_bar.dart';
import 'package:sarraf/feature/settings/ui/widgets/language_section.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            vertical: 12.h,
            horizontal: 24.w,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        const CustomSettingsBar(),
                        verticalSpacing(16),
                        const Apepearance(),
                        verticalSpacing(32),
                        const LanguageSection(),
                        const Spacer(),
                        Text(
                          "Sarraf · Version 1.0.0",
                          style: TextStyles.font12ScondaryRegular(context),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
