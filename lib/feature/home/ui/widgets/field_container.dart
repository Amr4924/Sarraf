import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/core/theming/style.dart';
import 'package:sarraf/feature/home/data/currencies_model.dart';
import 'package:sarraf/feature/home/ui/widgets/app_field.dart';

class FieldContainer extends StatefulWidget {
  const FieldContainer({super.key});

  @override
  State<FieldContainer> createState() => _FieldContainerState();
}

class _FieldContainerState extends State<FieldContainer> {
  String nameCurrencyFrom = currenciesList[0].nameCurrencies;
  String selectedCurrencyFrom = currenciesList[0].code;
  String symbolFrom = currenciesList[0].symbol;

  String nameCurrencyTo = currenciesList[1].nameCurrencies;
  String selectedCurrencyTo = currenciesList[1].code;
  String symbolTo = currenciesList[1].symbol;
  double result = 0.00;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            AppField(
              autofocus: false,
              nameCurrency: nameCurrencyFrom,
              selectedCurrency: selectedCurrencyFrom,
              symbol: symbolFrom,
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
                            leading: CircleAvatar(
                              child: Text(currencies.symbol),
                            ),
                            title: Text(currencies.code),
                            subtitle: Text(currencies.nameCurrencies),
                            onTap: () {
                              setState(() {
                                selectedCurrencyFrom = currencies.code;
                                nameCurrencyFrom = currencies.nameCurrencies;
                                symbolFrom = currencies.symbol;
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
            ),
            verticalSpacing(8),
            AppField(
              color: Theme.of(context).colorScheme.outline,
              title: "currency-to".tr(),
              nameCurrency: nameCurrencyTo,
              selectedCurrency: selectedCurrencyTo,
              symbol: symbolTo,
              widget: Text(
                "$result",
                style: TextStyles.font32PrimaryBold(context),
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
                            leading: CircleAvatar(
                              child: Text(currencies.symbol),
                            ),
                            title: Text(currencies.code),
                            subtitle: Text(currencies.nameCurrencies),
                            onTap: () {
                              setState(() {
                                selectedCurrencyTo = currencies.code;
                                nameCurrencyTo = currencies.nameCurrencies;
                                symbolTo = currencies.symbol;
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
                onPressed: () {},
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
  }
}
