// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/core/theming/style.dart';
import 'package:sarraf/feature/home/data/currencies_model.dart';
import 'package:sarraf/feature/home/ui/widgets/app_field.dart';

class FieldFormTo extends StatefulWidget {
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
  State<FieldFormTo> createState() => _FieldFormToState();
}

class _FieldFormToState extends State<FieldFormTo> {
  @override
  Widget build(BuildContext context) {
    return AppField(
      color: Theme.of(context).colorScheme.outline,
      title: "currency-to".tr(),
      nameCurrency: widget.nameCurrencyTo,
      selectedCurrency: widget.selectedCurrencyTo,
      symbol: widget.symbolTo,
      widget: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          widget.result.toStringAsFixed(2),
          style: TextStyles.font32PrimaryBold(context),
        ),
      ),
      onTap: () {
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
                      setState(() {
                        widget.selectedCurrencyTo = currencies.code;
                        widget.nameCurrencyTo = currencies.nameCurrencies;
                        widget.symbolTo = currencies.symbol;
                      });
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
