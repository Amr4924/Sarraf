import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/core/Network/api_manager.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/feature/home/data/currencies_model.dart';
import 'package:sarraf/feature/home/data/currency_rates_model.dart';
import 'package:sarraf/feature/home/services/home_services.dart';
import 'package:sarraf/feature/home/ui/widgets/field_form_to.dart';
import 'package:sarraf/feature/home/ui/widgets/filed_form_from.dart';
import 'package:sarraf/feature/home/ui/widgets/rate_info.dart';

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

  void replace() {
    String tempNameCurrencyFrom = nameCurrencyFrom;
    String tempSelectedCurrencyFrom = selectedCurrencyFrom;
    String tempSymbolFrom = symbolFrom;
    final amountValue = double.tryParse(amount.text);
    setState(() {
      nameCurrencyFrom = nameCurrencyTo;
      selectedCurrencyFrom = selectedCurrencyTo;
      symbolFrom = symbolTo;

      nameCurrencyTo = tempNameCurrencyFrom;
      selectedCurrencyTo = tempSelectedCurrencyFrom;
      symbolTo = tempSymbolFrom;
      result = amountValue == null || data == null
          ? 0
          : data!.convert(
              amountValue,
              selectedCurrencyFrom,
              selectedCurrencyTo,
            );
    });
  }

  void _updateResult() {
    final amountValue = double.tryParse(amount.text);
    setState(() {
      result = amountValue == null || data == null
          ? 0
          : data!.convert(
              amountValue,
              selectedCurrencyFrom,
              selectedCurrencyTo,
            );
    });
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
                FieldFormFrom(
                  data: data,
                  result: result,
                  onResultyChanged: (value) {
                    setState(() {
                      result = value;
                    });
                  },
                  selectedCurrencyTo: selectedCurrencyTo,
                  amount: amount,
                  selectedCurrencyFrom: selectedCurrencyFrom,
                  nameCurrencyFrom: nameCurrencyFrom,
                  symbolFrom: symbolFrom,
                  onCurrencyChanged: (currency) {
                    setState(() {
                      selectedCurrencyFrom = currency.code;
                      nameCurrencyFrom = currency.nameCurrencies;
                      symbolFrom = currency.symbol;
                      _updateResult();
                    });
                  },
                ),
                verticalSpacing(8),
                FieldFormTo(
                  nameCurrencyTo: nameCurrencyTo,
                  selectedCurrencyTo: selectedCurrencyTo,
                  symbolTo: symbolTo,
                  result: result,
                  onCurrencyChanged: (currency) {
                    setState(() {
                      selectedCurrencyTo = currency.code;
                      nameCurrencyTo = currency.nameCurrencies;
                      symbolTo = currency.symbol;
                      _updateResult();
                    });
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
                      replace();
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
        RateInfo(
          data: data,
          selectedCurrencyTo: selectedCurrencyTo,
          selectedCurrencyFrom: selectedCurrencyFrom,
        ),
      ],
    );
  }
}
