import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_ui/material_ui.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/core/theming/style.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SvgPicture.asset(
            "assets/svgs/ios_icon.svg",
            width: 56.w,
            height: 56.h,
          ),
        ),
        verticalSpacing(10),
        Text("Welcome to Sarraf", style: TextStyles.font24PrimaryBold(context)),
        verticalSpacing(10),
        Text(
          "Set up your preferences. You can change them anytime in Settings.",
          style: TextStyles.font15TextSecondryReglar(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
