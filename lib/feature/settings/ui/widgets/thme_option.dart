import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sarraf/core/helpers/spacing.dart';

class ThemeOption extends StatelessWidget {
  final String assetPath;
  final IconData icon;
  final String label;
  final bool selected;
  final ValueChanged<bool?> onChanged;

  const ThemeOption({
    required this.assetPath,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 178.h,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: selected ? colorScheme.primary : colorScheme.outline,
          width: selected ? 2.w : 1.w,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: SvgPicture.asset(
              assetPath,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          Row(
            children: [
              Icon(icon, size: 20.sp),
              horizontalSpacing(6),
              Expanded(child: Text(label)),
              Transform.scale(
                scale: 1.3,
                child: Checkbox(
                  shape: const CircleBorder(),
                  value: selected,
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
