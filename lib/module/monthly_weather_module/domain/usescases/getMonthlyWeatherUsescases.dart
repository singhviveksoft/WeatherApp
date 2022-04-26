import 'dart:convert';

import 'package:wheather_app/util/status.dart';

import '../../data/model/DailyWeather.dart';
import '../../../current_weather_module/data/model/Wheather.dart';

import '../repo/GetMonthlyWeatherRepo.dart';

class GetMonthlyWeatherUsesCases {
final GetMonthlyWeatherRepo getMonthlyWeatherRepo;
List<DailyWeather> _dailywheather_list = [];

  GetMonthlyWeatherUsesCases({required this.getMonthlyWeatherRepo});

Future<Status>getDailyMonthly(
    {required String key,
      required String start_date,
      required String end_date,
      required String postal_code,
      required String country}) async {
  var result = await getMonthlyWeatherRepo.getMonthlyWeather(
      key: key,
      start_date: start_date,
      end_date: end_date,
      postal_code: postal_code,
      country: country) ;

  if (result.code == 200) {
    var body = result.response.body;
    var wheather = DailyWeather.fromJson(jsonDecode(body));
    _dailywheather_list.add(wheather);
    return Status(code: 200, response: _dailywheather_list);
  } else {
    return Status(response: result.response);
  }
}



}