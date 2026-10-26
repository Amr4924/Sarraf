import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/core/Network/api_manager.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/core/theming/style.dart';
import 'package:sarraf/feature/home/data/currencies_model.dart';
import 'package:sarraf/feature/home/data/currency_rates_model.dart';
import 'package:sarraf/feature/home/services/home_services.dart';
import 'package:sarraf/feature/home/ui/widgets/app_field.dart';

class FieldContainer extends StatefulWidget {
  const FieldContainer({super.key});

  @override
  State<FieldContainer> createState() => _FieldContainerState();
}

class _FieldContainerState extends State<FieldContainer> {
  late String nameCurrencyFrom;
  late String selectedCurrencyFrom;
  late String symbolFrom;
  late TextEditingController amount;

  late String nameCurrencyTo;
  late String selectedCurrencyTo;
  late String symbolTo;
  late ApiManager apiManager;
  late HomeServices homeService;
  double result = 0.00;
  CurrencyRatesModel? data;

  Future<void> _loadData() async {
    try {
      final responce = await homeService.currencyRates();
      debugPrint(responce.baseCode);
      if (mounted) {
        setState(() {
          data = responce;
        });
      }
    } on DioException catch (e) {
      debugPrint(e.toString());
    }
  }

  void convertRate() {
    final rates = data;
    final amountValue = double.tryParse(amount.text);
    if (rates == null || amountValue == null) {
      return;
    }

    setState(() {
      result = rates.convert(
        amountValue,
        selectedCurrencyFrom,
        selectedCurrencyTo,
      );
    });
    debugPrint("$result");
  }

  @override
  void initState() {
    nameCurrencyFrom = currenciesList[0].nameCurrencies;
    selectedCurrencyFrom = currenciesList[0].code;
    symbolFrom = currenciesList[0].symbol;

    nameCurrencyTo = currenciesList[1].nameCurrencies;
    selectedCurrencyTo = currenciesList[1].code;
    symbolTo = currenciesList[1].symbol;
    apiManager = ApiManager();
    homeService = HomeServices(apiManager);
    amount = TextEditingController();
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Column(
              children: [
                AppField(
                  controller: amount,
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
                              CurrenciesModel currencies =
                                  currenciesList[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  child: Text(currencies.symbol),
                                ),
                                title: Text(currencies.code),
                                subtitle: Text(currencies.nameCurrencies),
                                onTap: () {
                                  setState(() {
                                    selectedCurrencyFrom = currencies.code;
                                    nameCurrencyFrom =
                                        currencies.nameCurrencies;
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
                  widget: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      result.toStringAsFixed(2),
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
                              CurrenciesModel currencies =
                                  currenciesList[index];
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
                    onPressed: () {
                      convertRate();
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
        ),
        verticalSpacing(16),
        Center(
          child: Container(
            width: 270.w,
            height: 38.h,
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(999.r),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "1 ",
                    style: TextStyles.font15TextPrimarySemiBold(context),
                  ),
                  TextSpan(
                    text: selectedCurrencyFrom,
                    style: TextStyles.font15TextPrimarySemiBold(context),
                  ),
                  TextSpan(
                    text: data == null
                        ? " = -- $selectedCurrencyTo"
                        : " = ${data!.convert(1, selectedCurrencyFrom, selectedCurrencyTo).toStringAsFixed(2)} $selectedCurrencyTo",
                    style: TextStyles.font15TextPrimarySemiBold(context),
                  ),
                  TextSpan(
                    text: "     ${"updated-just-now".tr()}",
                    style: TextStyles.font12ScondaryRegular(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
