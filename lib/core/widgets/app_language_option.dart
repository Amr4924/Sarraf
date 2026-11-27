import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:material_ui/material_ui.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/core/theming/style.dart';

class AppLanguageOption extends StatelessWidget {
  final bool isSelect;
  final String sympol;
  final String label;
  final String subtitle;
  final void Function()? onTap;
  const AppLanguageOption({
    super.key,
    required this.isSelect,
    required this.sympol,
    required this.label,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 166.w,
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
            decoration: BoxDecoration(
              color: isSelect
                  ? colorScheme.primaryContainer
                  : colorScheme.surface,
              border: Border.all(
                color: isSelect ? colorScheme.primary : colorScheme.outline,
                width: isSelect ? 2.w : 1.w,
              ),
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 18.r,
                      backgroundColor: colorScheme.surface,
                      child: Text(
                        sympol,
                        style: TextStyles.font15TextPrimarySemiBold(context),
                      ),
                    ),
                    horizontalSpacing(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label,
                          style: TextStyles.font15TextPrimarySemiBold(context),
                        ),
                        Text(
                          subtitle,
                          style: TextStyles.font12ScondaryRegular(context),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: isSelect
                      ? CircleAvatar(
                          radius: 9.r,
                          backgroundColor: colorScheme.primary,
                          child: Icon(Icons.check, size: 13.sp),
                        )
                      : SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
