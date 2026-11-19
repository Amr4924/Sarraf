import 'package:sarraf/core/Network/api_gold_managment.dart';
import 'package:sarraf/core/constants/api_endpoint.dart';
import 'package:sarraf/feature/gold/data/models/gold_model.dart';

class GoldServices {
  final ApiGoldManagment apigoldManagment;
  GoldServices(this.apigoldManagment);

  Future<GoldModel> getGoldPrice() async {
    final response = await apigoldManagment.dio.get(ApiEndpoint.goldEndPoint);
    final jsonData = response.data;
    final goldPrice = GoldModel.fromJson(jsonData);

    return goldPrice;
  }
}
