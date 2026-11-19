import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarraf/feature/home/logic/currency_rates/cubit/currency_rate_state.dart';
import 'package:sarraf/feature/home/data/services/home_services.dart';

class CurrencyRatesCubit extends Cubit<CurrencyRatesState> {
  HomeServices homeservices;
  CurrencyRatesCubit(this.homeservices) : super(CurrencyRatesInitial());
  
  Future<void> getCurrencyRate() async {
    emit(CurrencyRatesLoding());
    try {
      final currencyRates = await homeservices.currencyRates();
      emit(CurrencyRatesSuccess(currencyRates));
    } catch (e) {
      emit(CurrencyRatesError(e.toString()));
    }
  }
  
}
