import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/feature/gold/data/models/gold_karat.dart';
import 'package:shimmer/shimmer.dart';

class KaratShimmer extends StatelessWidget {
  const KaratShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final colorScheme = Theme.of(context).colorScheme;
        return Shimmer.fromColors(
          baseColor: colorScheme.outline,
          highlightColor: colorScheme.surface,
          child: ListTile(
            leading: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            title: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                width: 80.w,
                height: 14.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 6.h),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Container(
                  width: 60.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
              ),
            ),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 55.w,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
                SizedBox(height: 6.h),
                Container(
                  width: 35.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(color: Colors.white70),
      itemCount: goldKaratList.length,
    );
  }
}
