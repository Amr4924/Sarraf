import 'package:sarraf/core/Network/ap_currencyi_rate_manager.dart';
import 'package:sarraf/core/constants/api_endpoint.dart';
import 'package:sarraf/feature/home/data/models/currency_rates_model.dart';

class HomeServices {
  ApiCurrencyRateManager apiManager;
  HomeServices(this.apiManager);

  Future<CurrencyRatesModel> currencyRates() async {
    final responce = await apiManager.dio.get(ApiEndpoint.endPoint);

    final Map<String, dynamic> responceJsonData = responce.data;
    final modelData = CurrencyRatesModel.fromJson(responceJsonData);
    return modelData;
  }
}
