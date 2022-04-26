import 'package:flutter/cupertino.dart';
import 'package:wheather_app/module/current_weather_module/data/model/Wheather.dart';
import 'package:wheather_app/module/current_weather_module/domain/usecases/getwearherusescases.dart';

import 'package:wheather_app/util/status.dart';

class WeatherProvider with ChangeNotifier {
  List<Weather> wheather_list_type = [];
  String error_type = 'Loading';
  final GetWeatherUseCases getWeatherUseCases;

  WeatherProvider({required this.getWeatherUseCases});

  addWeatherDetail({required String lat, required String lon}) async {
    var type = await getWeatherUseCases.getWeather(lat: lat, lon: lon);

    switch (type.code) {
      case 101:
        addError(type.response.toString());
        break;

      default:
        addItem(type.response);
    }
  }

  addItem(List<Weather> wheather_list) {
    wheather_list_type = wheather_list;
    notifyListeners();
  }

  addError(String error) {
    error_type = error;
    notifyListeners();
  }
}
