import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarraf/core/models/currencies_model.dart';
import 'package:sarraf/feature/gold/logic/operations/cubit/operation_gold_state.dart';

class OperationsGoldCubit extends Cubit<OperatiopnGoldState> {
  OperationsGoldCubit() : super(OperationGoldInitial());

  void selectCurrency(CurrenciesModel newCurrency) {
    emit(state.copyWith(selectCurrency: newCurrency));
  }
}
