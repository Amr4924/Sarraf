import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/feature/home/data/currencies_model.dart';
import 'package:sarraf/feature/home/data/currency_rates_model.dart';
import 'package:sarraf/feature/home/ui/widgets/app_field.dart';

class FieldFormFrom extends StatefulWidget {
  TextEditingController amount;
  String nameCurrencyFrom;
  String selectedCurrencyFrom;
  String selectedCurrencyTo;
  String symbolFrom;
  final ValueChanged<CurrenciesModel> onCurrencyChanged;
  final ValueChanged<double> onResultyChanged;
  final CurrencyRatesModel? data;
  double result;
  FieldFormFrom({
    super.key,
    required this.amount,
    required this.selectedCurrencyFrom,
    required this.nameCurrencyFrom,
    required this.symbolFrom,
    required this.onCurrencyChanged,
    required this.onResultyChanged,
    required this.selectedCurrencyTo,
    required this.data,
    required this.result,
  });

  @override
  State<FieldFormFrom> createState() => _FieldFormFromState();
}

class _FieldFormFromState extends State<FieldFormFrom> {
  @override
  Widget build(BuildContext context) {
    return AppField(
      controller: widget.amount,
      autofocus: false,
      nameCurrency: widget.nameCurrencyFrom,
      selectedCurrency: widget.selectedCurrencyFrom,
      symbol: widget.symbolFrom,
      onChanged: (value) {
        final rates = widget.data;
        final amountValue = double.tryParse(value);
        final convertedValue = rates == null || amountValue == null
            ? 0.0
            : rates.convert(
                amountValue,
                widget.selectedCurrencyFrom,
                widget.selectedCurrencyTo,
              );
        setState(() {
          widget.result = convertedValue;
        });
        widget.onResultyChanged(widget.result);
      },
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
                        widget.selectedCurrencyFrom = currencies.code;
                        widget.nameCurrencyFrom = currencies.nameCurrencies;
                        widget.symbolFrom = currencies.symbol;
                      });
                      widget.onCurrencyChanged(currencies);
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
