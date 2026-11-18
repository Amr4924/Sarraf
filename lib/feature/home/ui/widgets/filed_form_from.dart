import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/feature/home/data/models/currencies_model.dart';
import 'package:sarraf/core/widgets/app_field.dart';
import 'package:sarraf/feature/home/logic/operation/cubit/operation_cubit.dart';

class FieldFormFrom extends StatelessWidget {
  TextEditingController amount;
  String nameCurrencyFrom;
  String selectedCurrencyFrom;
  String selectedCurrencyTo;
  String symbolFrom;

  FieldFormFrom({
    super.key,
    required this.amount,
    required this.selectedCurrencyFrom,
    required this.nameCurrencyFrom,
    required this.symbolFrom,
    required this.selectedCurrencyTo,

  });

  @override
  Widget build(BuildContext context) {
    return AppField(
      controller: amount,
      autofocus: false,
      nameCurrency: nameCurrencyFrom,
      selectedCurrency: selectedCurrencyFrom,
      symbol: symbolFrom,
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
                      operationCubit.selectCurrencyFrom(currencies);
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
