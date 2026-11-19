// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/core/theming/style.dart';
import 'package:sarraf/core/models/currencies_model.dart';
import 'package:sarraf/core/widgets/app_field.dart';
import 'package:sarraf/feature/home/logic/operation/cubit/operation_cubit.dart';

class FieldFormTo extends StatelessWidget {
  String nameCurrencyTo;
  String selectedCurrencyTo;
  String symbolTo;
  double result;
  FieldFormTo({
    super.key,
    required this.nameCurrencyTo,
    required this.selectedCurrencyTo,
    required this.symbolTo,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return AppField(
      color: Theme.of(context).colorScheme.outline,
      title: "currency-to".tr(),
      nameCurrency: nameCurrencyTo,
      selectedCurrency: selectedCurrencyTo,
      symbol: symbolTo,
      widget: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          NumberFormat(
            '#,##0.00',
            'en_US',
          ).format(context.watch<OperationCubit>().state.result),
          style: TextStyles.font32PrimaryBold(context),
        ),
      ),
      onTap: () {
        final operationCubit = context.read<OperationCubit>();
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(16),
              height: 300.h,
              child: ListView.builder(
                itemCount: currenciesList.length,
                itemBuilder: (context, index) {
                  CurrenciesModel currencies = currenciesList[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text(currencies.symbol)),
                    title: Text(currencies.code),
                    subtitle: Text(currencies.nameCurrencies),
                    onTap: () {
                      operationCubit.selectCurrencyTo(currencies);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
