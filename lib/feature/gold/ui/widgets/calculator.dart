import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/core/theming/style.dart';
import 'package:sarraf/core/widgets/app_text_field.dart';
import 'package:sarraf/feature/gold/logic/operations/cubit/operation_gold_cubit.dart';
import 'package:sarraf/feature/gold/logic/operations/cubit/operation_gold_state.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "weight".tr(),
                  style: TextStyles.font13ScondaryMedium(context),
                ),
                AppTextField(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  onChanged: (value) {
                    context.read<OperationsGoldCubit>().goldPriceCalculation(
                      value,
                      21,
                    );
                  },
                ),
              ],
            ),
          ),
          verticalSpacing(12),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.r),
              color: Theme.of(context).colorScheme.tertiaryContainer,
            ),
            child: BlocBuilder<OperationsGoldCubit, OperationGoldState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "total-value".tr(),
                      style: TextStyles.font13ScondaryMedium(context),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: NumberFormat('#,##0.00', 'en_US').format(
                              context.watch<OperationsGoldCubit>().state.result,
                            ),
                            style: TextStyles.font32TextPrimaryBold(context),
                          ),
                          TextSpan(
                            text: "  ${state.selectCurrency.code}",
                            style: TextStyles.font15TextPrimarySemiBold(
                              context,
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpacing(2),
                    Text(
                      "${state.amount} g . ${state.karat}K . ${NumberFormat('#,##0.00', 'en_US').format(context.read<OperationsGoldCubit>().getGramPriceForKarat("21"))} ${state.selectCurrency.code} / g",
                      style: TextStyles.font13ScondaryMedium(context),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
