import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarraf/core/models/currencies_model.dart';
import 'package:sarraf/feature/home/data/models/currency_rates_model.dart';
import 'package:sarraf/feature/home/logic/operation/cubit/operation_state.dart';

class OperationCubit extends Cubit<OperationState> {
  OperationCubit() : super(OperationInitial());

  void setRates(CurrencyRatesModel ratesModel) {
    final newResult = _culculate(
      amount: state.amount,
      fromCode: state.selectFrom.code,
      toCode: state.selectTo.code,
      rates: ratesModel,
    );
    emit(state.copyWith(rates: ratesModel, result: newResult));
  }

  void swapSelector() {
    final newFrom = state.selectTo;
    final newTo = state.selectFrom;
    final newResult = _culculate(
      amount: state.amount,
      fromCode: newFrom.code,
      toCode: newTo.code,
      rates: state.rates,
    );
    emit(
      state.copyWith(selectFrom: newFrom, selectTo: newTo, result: newResult),
    );
  }

  void selectCurrencyFrom(CurrenciesModel newCurrencyFrom) {
    final newResult = _culculate(
      amount: state.amount,
      fromCode: newCurrencyFrom.code,
      toCode: state.selectTo.code,
      rates: state.rates,
    );
    emit(state.copyWith(selectFrom: newCurrencyFrom, result: newResult));
  }

  void selectCurrencyTo(CurrenciesModel newCurrencyTo) {
    final newResult = _culculate(
      amount: state.amount,
      fromCode: state.selectFrom.code,
      toCode: newCurrencyTo.code,
      rates: state.rates,
    );
    emit(state.copyWith(selectTo: newCurrencyTo, result: newResult));
  }

  void currenctyRateAccount(String amount) {
    final parseAmount = double.tryParse(amount) ?? 0.0;
    final newResult = _culculate(
      amount: parseAmount,
      fromCode: state.selectFrom.code,
      toCode: state.selectTo.code,
      rates: state.rates,
    );
    emit(state.copyWith(result: newResult, amount: parseAmount));
  }

  double getCurrentRate() {
    return _culculate(
      amount: 1,
      fromCode: state.selectFrom.code,
      toCode: state.selectTo.code,
      rates: state.rates,
    );
  }

  void reset() {
    emit(state.copyWith(result: 0.0, amount: 0.0));
  }

  double _culculate({
    required double amount,
    required String fromCode,
    required String toCode,
    required CurrencyRatesModel? rates,
  }) {
    if (rates == null || amount == 0.0) return 0.0;

    final double fromRate = (rates.rates[fromCode] ?? 1.0);
    final double toRate = (rates.rates[toCode] ?? 1.0);
    return (amount / fromRate) * toRate;
  }
}
