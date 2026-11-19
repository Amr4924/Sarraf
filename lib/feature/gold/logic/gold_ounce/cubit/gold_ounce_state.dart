import 'package:sarraf/feature/gold/data/models/gold_model.dart';

class GoldOnunceState {}

class GoldOunceInitial extends GoldOnunceState {}

class GoldOunceLoding extends GoldOnunceState {}

class GoldOunceSuccesee extends GoldOnunceState {
  final GoldModel goldModel;
  GoldOunceSuccesee(this.goldModel);
}

class GoldOunceError extends GoldOnunceState {
  final String errorMessage;
  GoldOunceError(this.errorMessage);
}
