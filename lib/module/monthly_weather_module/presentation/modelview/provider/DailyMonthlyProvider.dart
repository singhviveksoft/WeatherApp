import 'package:flutter/cupertino.dart';
import 'package:wheather_app/module/monthly_weather_module/data/model/DailyWeather.dart';



import '../../../domain/usescases/getMonthlyWeatherUsescases.dart';

class DailyMonthlyProvider extends ChangeNotifier {
  List<DailyWeather> list = [];
  String error_type = 'Loading';
  final GetMonthlyWeatherUsesCases getMonthlyWeatherUsesCases;

  DailyMonthlyProvider({required this.getMonthlyWeatherUsesCases});

  getDailyMonthly({required String key,
    required String start_date,
    required String end_date,
    required String postal_code,
    required String country}) async {
    var type = await getMonthlyWeatherUsesCases.getDailyMonthly(key: key,
        start_date: start_date,
        end_date: end_date,
        postal_code: postal_code,
        country: country);
    switch (type.code) {
      case 101:
        addError(type.response.toString());
        break;

      default:
        addItem(type.response);
    }
  }

  addItem(List<DailyWeather> wheather_list) {
    list = wheather_list;
    notifyListeners();
  }

  addError(String error) {
    error_type = error;
    notifyListeners();
  }
}