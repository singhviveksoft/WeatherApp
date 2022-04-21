import 'package:flutter/cupertino.dart';
import 'package:wheather_app/model/Wheather.dart';
import 'package:wheather_app/repo/WeartherRepo.dart';
import 'package:wheather_app/util/status.dart';

class WeatherProvider with ChangeNotifier {
  List<Wheather> wheather_list_type = [];
  String error_type = 'Loading';

  addWeatherDetail({required String lat, required String lon}) async {
    var type = await WeatherRepo().getWeather(lat: lat, lon: lon);

    switch (type.code) {
      case 101:
        addError(type.response.toString());
        break;

      default:
        addItem(type.response);
    }
  }

  addItem(List<Wheather> wheather_list) {
    wheather_list_type = wheather_list;
    notifyListeners();
  }

  addError(String error) {
    error_type = error;
    notifyListeners();
  }
}
