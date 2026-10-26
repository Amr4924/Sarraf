import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/feature/settings/ui/widgets/apperance.dart';
import 'package:sarraf/feature/settings/ui/widgets/custom_settings_bar.dart';
import 'package:sarraf/feature/settings/ui/widgets/language_section.dart';

class SettingsScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            vertical: 12.h,
            horizontal: 24.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSettingsBar(),
                verticalSpacing(16),
                const Apepearance(),
                verticalSpacing(32),
                const LanguageSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
