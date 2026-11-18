import 'package:sarraf/feature/home/data/currency_rates_model.dart';

class CurrencyRatesState {}

class CurrencyRatesInitial extends CurrencyRatesState {}

class CurrencyRatesLoding extends CurrencyRatesState {}

class CurrencyRatesSuccess extends CurrencyRatesState {
  final CurrencyRatesModel currencyRate;
  CurrencyRatesSuccess(this.currencyRate);
}

class CurrencyRatesError extends CurrencyRatesState {
  final String messageError;
  CurrencyRatesError(this.messageError);
}

class CurrencyRatesUpdate extends CurrencyRatesState{}