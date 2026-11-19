import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarraf/feature/gold/data/services/gold_services.dart';
import 'package:sarraf/feature/gold/logic/gold_ounce/cubit/gold_ounce_state.dart';

class GoldOunceCubit extends Cubit<GoldOnunceState> {
  final GoldServices goldService;

  GoldOunceCubit(this.goldService) : super(GoldOunceInitial());

  Future<void> getGoldOunce() async {
    emit(GoldOunceLoding());
    try {
      final goldOunce = await goldService.getGoldPrice();
      emit(GoldOunceSuccesee(goldOunce));
    } catch (e) {
      emit(GoldOunceError(e.toString()));
    }
  }
}
