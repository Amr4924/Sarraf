import 'package:sarraf/core/models/currencies_model.dart';

class OperatiopnGoldState {
  CurrenciesModel selectCurrency;
  OperatiopnGoldState({required this.selectCurrency});

  OperatiopnGoldState copyWith({CurrenciesModel? selectCurrency}) {
    return OperatiopnGoldState(
      selectCurrency: selectCurrency ?? this.selectCurrency,
    );
  }
}

class OperationGoldInitial extends OperatiopnGoldState {
  OperationGoldInitial() : super(selectCurrency: currenciesList[0]);
}
