import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarraf/core/models/currencies_model.dart';
import 'package:sarraf/feature/gold/data/models/gold_model.dart';
import 'package:sarraf/feature/gold/logic/operations/cubit/operation_gold_state.dart';
import 'package:sarraf/feature/home/data/models/currency_rates_model.dart';

class OperationsGoldCubit extends Cubit<OperationGoldState> {
  OperationsGoldCubit() : super(OperationGoldInitial());

  void setRatesAndGoldOunce(
    CurrencyRatesModel ratesModel,
    GoldModel goldModel,
  ) {
    final newResult = _calc(
      amount: state.amount,
      selectCurrencyCode: state.selectCurrency.code,
      karat: state.karat,
      rates: ratesModel,
      goldOunce: goldModel,
    );
    emit(
      state.copyWith(
        rates: ratesModel,
        goldOunce: goldModel,
        result: newResult,
      ),
    );
  }

  void selectCurrency(CurrenciesModel newCurrency) {
    final newResult = _calc(
      amount: state.amount,
      selectCurrencyCode: newCurrency.code,
      karat: state.karat,
      rates: state.rates,
      goldOunce: state.goldOunce,
    );
    emit(state.copyWith(selectCurrency: newCurrency, result: newResult));
  }

  void goldPriceCalculation(String amount, int karat) {
    final doubleAmount = double.tryParse(amount) ?? 0.0;
    final newResult = _calc(
      amount: doubleAmount,
      selectCurrencyCode: state.selectCurrency.code,
      karat: karat,
      rates: state.rates,
      goldOunce: state.goldOunce,
    );
    emit(state.copyWith(amount: doubleAmount, karat: karat, result: newResult));
  }

  double getGramPriceForKarat(String karat) {
    final intKarat = int.tryParse(karat) ?? 0;
    return _calc(
      amount: 1,
      selectCurrencyCode: state.selectCurrency.code,
      karat: intKarat,
      rates: state.rates,
      goldOunce: state.goldOunce,
    );
  }

  void reset() {
    emit(state.copyWith(amount: 0.0, result: 0.0));
  }

  double _calc({
    required double amount,
    required String selectCurrencyCode,
    required int karat,
    required CurrencyRatesModel? rates,
    required GoldModel? goldOunce,
  }) {
    if (goldOunce == null || rates == null || amount == 0.0) return 0.0;
    final fromUsd = (rates.rates["USD"] ?? 1.0);
    final toSelected = (rates.rates[selectCurrencyCode] ?? 1.0);

    final exchangerate = (1 / fromUsd) * toSelected;
    final goldOunceUsd = goldOunce.gold?.ounceUsd ?? 0.0;

    return ((goldOunceUsd / 31.1035) * (karat / 24) * exchangerate * amount);
  }
}
