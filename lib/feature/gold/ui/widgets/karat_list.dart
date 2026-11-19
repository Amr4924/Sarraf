import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/core/theming/style.dart';
import 'package:sarraf/core/theming/text_weight.dart';
import 'package:sarraf/feature/gold/data/models/gold_karat.dart';
import 'package:sarraf/feature/gold/logic/operations/cubit/operation_gold_cubit.dart';

class KaratList extends StatelessWidget {
  const KaratList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final goldKarat = goldKaratList[index];
          return ListTile(
            leading: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  "${goldKarat.karat}K",
                  style: TextStyles.font15TextPrimarySemiBold(context).copyWith(
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
                ),
              ),
            ),
            title: Text(
              "${goldKarat.karat} Karat",
              style: TextStyles.font15TextPrimarySemiBold(context),
            ),
            subtitle: Text(
              goldKarat.purePercent,
              style: TextStyles.font13ScondaryMedium(context)
                  .copyWith(fontWeight: TextWeightHelper.regular),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "0.0",
                  style: TextStyles.font17TextSecondrySemiBold(context),
                ),
                Text(
                  "${context.watch<OperationsGoldCubit>().state.selectCurrency.code}/g",
                  style: TextStyles.font12ScondaryRegular(context),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(color: Colors.white70),
        itemCount: goldKaratList.length,
      ),
    );
  }
}
