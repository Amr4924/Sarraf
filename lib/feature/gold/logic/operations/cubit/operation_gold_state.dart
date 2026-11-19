import 'package:sarraf/core/models/currencies_model.dart';
import 'package:sarraf/feature/gold/data/models/gold_model.dart';
import 'package:sarraf/feature/home/data/models/currency_rates_model.dart';

class OperationGoldState {
  double amount;
  double result;
  int karat;
  CurrenciesModel selectCurrency;
  GoldModel? goldOunce;
  CurrencyRatesModel? rates;

  OperationGoldState({
    required this.selectCurrency,
    required this.amount,
    required this.result,
    required this.goldOunce,
    required this.rates,
    required this.karat
  });

  OperationGoldState copyWith({
    CurrenciesModel? selectCurrency,
    double? amount,
    double? result,
    int? karat,
    GoldModel? goldOunce,
    CurrencyRatesModel? rates,
  }) {
    return OperationGoldState(
      selectCurrency: selectCurrency ?? this.selectCurrency,
      amount: amount ?? this.amount,
      goldOunce: goldOunce ?? this.goldOunce,
      rates: rates ?? this.rates,
      result: result ?? this.result,
      karat: karat??this.karat
    );
  }
}

class OperationGoldInitial extends OperationGoldState {
  OperationGoldInitial()
    : super(
        selectCurrency: currenciesList[0],
        amount: 0.0,
        result: 0.0,
        goldOunce: null,
        rates: null,
        karat: 0,
      );
}
