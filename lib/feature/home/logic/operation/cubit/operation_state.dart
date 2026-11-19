import 'package:sarraf/core/models/currencies_model.dart';
import 'package:sarraf/feature/home/data/models/currency_rates_model.dart';

class OperationState {
  final double result;
  final CurrenciesModel selectFrom;
  final CurrenciesModel selectTo;
  final double amount;
  final CurrencyRatesModel? rates;
  OperationState(
    this.result,
    this.selectFrom,
    this.selectTo,
    this.amount,
    this.rates,
  );

  OperationState copyWith({
    double? result,
    CurrenciesModel? selectFrom,
    CurrenciesModel? selectTo,
    double? amount,
    CurrencyRatesModel? rates,
  }) {
    return OperationState(
      result ?? this.result,
      selectFrom ?? this.selectFrom,
      selectTo ?? this.selectTo,
      amount ?? this.amount,
      rates ?? this.rates,
    );
  }
}

class OperationInitial extends OperationState {
  OperationInitial()
    : super(0.0, currenciesList[0], currenciesList[1], 0.0, null);
}
