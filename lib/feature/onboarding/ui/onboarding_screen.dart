import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:material_ui/material_ui.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/core/routing/routes.dart';
import 'package:sarraf/core/theming/style.dart';
import 'package:sarraf/feature/onboarding/ui/widgets/appearance_select.dart';
import 'package:sarraf/feature/onboarding/ui/widgets/base_currency.dart';
import 'package:sarraf/feature/onboarding/ui/widgets/language_select.dart';
import 'package:sarraf/feature/onboarding/ui/widgets/onboarding_header.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OnboardingHeader(),
                verticalSpacing(16),
                const AppearanceSelect(),
                verticalSpacing(22),
                const LanguageSelect(),
                verticalSpacing(22),
                const BaseCurrency(),
                verticalSpacing(29),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16),
                        backgroundColor: colorScheme.primary,
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.homeScreen,
                          (route) => false,
                        );
                      },
                      child: Text(
                        "Get started",
                        style: TextStyles.font17TextSecondrySemiBold(context)
                            .copyWith(color: colorScheme.onPrimary),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
