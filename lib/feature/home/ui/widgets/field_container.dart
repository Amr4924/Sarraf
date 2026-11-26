import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/core/theming/style.dart';
import 'package:sarraf/feature/home/logic/currency_rates/cubit/currency_rate_cubit.dart';
import 'package:sarraf/feature/home/logic/currency_rates/cubit/currency_rate_state.dart';
import 'package:sarraf/feature/home/logic/operation/cubit/operation_cubit.dart';
import 'package:sarraf/feature/home/logic/operation/cubit/operation_state.dart';
import 'package:sarraf/feature/home/ui/widgets/field_form_to.dart';
import 'package:sarraf/feature/home/ui/widgets/filed_form_from.dart';
import 'package:sarraf/feature/home/ui/widgets/rate_info.dart';

class FieldContainer extends StatefulWidget {
  const FieldContainer({super.key});

  @override
  State<FieldContainer> createState() => _FieldContainerState();
}

class _FieldContainerState extends State<FieldContainer> {
  @override
  void initState() {
    super.initState();
    context.read<CurrencyRatesCubit>().getCurrencyRate();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<OperationCubit, OperationState>(
          builder: (context, state) {
            return Stack(
              children: [
                Column(
                  children: [
                    FieldFormFrom(
                      selectedCurrencyTo: state.selectTo.code,
                      selectedCurrencyFrom: state.selectFrom.code,
                      nameCurrencyFrom: state.selectFrom.nameCurrencies,
                      symbolFrom: state.selectFrom.symbol,
                    ),
                    verticalSpacing(8),
                    FieldFormTo(
                      nameCurrencyTo: state.selectTo.nameCurrencies,
                      selectedCurrencyTo: state.selectTo.code,
                      symbolTo: state.selectTo.symbol,
                      result: state.result,
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CircleAvatar(
                      radius: 24.r,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: IconButton(
                        onPressed: () {
                          context.read<OperationCubit>().swapSelector();
                        },
                        icon: Icon(
                          Icons.swap_vert,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        verticalSpacing(16),
        BlocConsumer<CurrencyRatesCubit, CurrencyRatesState>(
          builder: (context, state) {
            return RateInfo(
              selectedCurrencyTo: context
                  .watch<OperationCubit>()
                  .state
                  .selectTo
                  .code,
              selectedCurrencyFrom: context
                  .watch<OperationCubit>()
                  .state
                  .selectFrom
                  .code,
              isLoding: state is CurrencyRatesLoding,
              rates: context.read<OperationCubit>().getCurrentRate(),
            );
          },
          listener: (context, state) {
            if (state is CurrencyRatesSuccess) {
              context.read<OperationCubit>().setRates(state.currencyRate);
            } else if (state is CurrencyRatesError) {
              final colorScheme = Theme.of(context).colorScheme;
              AwesomeDialog(
                context: context,
                dialogBackgroundColor: Theme.of(context).colorScheme.surface,
                barrierColor: Colors.black87,
                animType: AnimType.rightSlide,
                customHeader: CircleAvatar(
                  radius: 38.r,
                  backgroundColor: colorScheme.errorContainer,
                  child: Icon(
                    Icons.error_outline_rounded,
                    size: 42,
                    color: colorScheme.error,
                  ),
                ),
                title: 'connection-error'.tr(),
                titleTextStyle: TextStyles.font20TextPrimaryBold(context),
                desc: 'failed-to-load-rates'.tr(),
                descTextStyle: TextStyles.font14TextSecondaryRegular(context),
                btnOkOnPress: () {},
                onDismissCallback: (type) {
                  context.read<CurrencyRatesCubit>().getCurrencyRate();
                },
                btnOkText: "retry".tr(),
                btnOkColor: colorScheme.primary,
                buttonsTextStyle: TextStyles.font16TextPrimarySemiBold(context)
                    .copyWith(color: colorScheme.onPrimary),
              ).show();
            }
          },
        ),
      ],
    );
  }
}
