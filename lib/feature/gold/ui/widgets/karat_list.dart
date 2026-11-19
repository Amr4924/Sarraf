import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/core/theming/style.dart';
import 'package:sarraf/core/theming/text_weight.dart';
import 'package:sarraf/feature/gold/data/models/gold_karat.dart';
import 'package:sarraf/feature/gold/logic/gold_ounce/cubit/gold_ounce_cubit.dart';
import 'package:sarraf/feature/gold/logic/gold_ounce/cubit/gold_ounce_state.dart';
import 'package:sarraf/feature/gold/logic/operations/cubit/operation_gold_cubit.dart';
import 'package:sarraf/feature/gold/ui/widgets/karat_shimmer.dart';
import 'package:sarraf/feature/home/logic/currency_rates/cubit/currency_rate_cubit.dart';
import 'package:sarraf/feature/home/logic/currency_rates/cubit/currency_rate_state.dart';

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
      child: BlocBuilder<GoldOunceCubit, GoldOnunceState>(
        builder: (context, state) {
          if (state is GoldOunceLoding) {
            return KaratShimmer();
          } else if (state is GoldOunceError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_off_rounded,
                    size: 70,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  verticalSpacing(8),
                  TextButton(
                    onPressed: () {
                      context.read<GoldOunceCubit>().getGoldOunce();
                    },
                    child: Text(
                      "retry".tr(),
                      style: TextStyles.font20TextPrimaryBold(
                        context,
                      ).copyWith(color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is GoldOunceSuccesee) {
            final ratesModel =
                (context.read<CurrencyRatesCubit>().state
                        as CurrencyRatesSuccess)
                    .currencyRate;
            final goldModel = state.goldModel;
            context.read<OperationsGoldCubit>().setRatesAndGoldOunce(
              ratesModel,
              goldModel,
            );
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final goldKarat = goldKaratList[index];
                final goldGramePrice = NumberFormat('#,##0.00', 'en_US').format(
                  context.read<OperationsGoldCubit>().getGramPriceForKarat(
                    goldKarat.karat,
                  ),
                );
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
                        style: TextStyles.font15TextPrimarySemiBold(context)
                            .copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.onTertiaryContainer,
                            ),
                      ),
                    ),
                  ),
                  title: Text(
                    "${goldKarat.karat} Karat",
                    style: TextStyles.font15TextPrimarySemiBold(context),
                  ),
                  subtitle: Text(
                    goldKarat.purePercentKey.tr(),
                    style: TextStyles.font13ScondaryMedium(
                      context,
                    ).copyWith(fontWeight: TextWeightHelper.regular),
                  ),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        goldGramePrice,
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
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.white70),
              itemCount: goldKaratList.length,
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
