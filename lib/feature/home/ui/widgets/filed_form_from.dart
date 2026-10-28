import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/feature/home/data/currencies_model.dart';
import 'package:sarraf/feature/home/ui/widgets/app_field.dart';

class FieldFormFrom extends StatefulWidget {
  TextEditingController amount;
  String nameCurrencyFrom;
  String selectedCurrencyFrom;
  String symbolFrom;
  FieldFormFrom({
    super.key,
    required this.amount,
    required this.selectedCurrencyFrom,
    required this.nameCurrencyFrom,
    required this.symbolFrom,
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
