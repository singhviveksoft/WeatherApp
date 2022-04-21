import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:wheather_app/model/DailyWeather.dart';
import 'package:wheather_app/model/Wheather.dart';
import 'package:wheather_app/util/status.dart';

import 'ApiCall.dart';

class WeatherRepo {
  List<Wheather> wheather_list = [];
  List<DailyWeather> _dailywheather_list = [];

  Future<Status> getWeather({required String lat, required String lon}) async {
    var result = await ApiCall().getWeather(lat: lat, lon: lon);

    if (result.code == 200) {
      var body = result.response.body;
      var wheather = Wheather.fromJson(jsonDecode(body));
      wheather_list.add(wheather);
      return Status(code: 200, response: wheather_list);
    } else {
      return Status(response: result.response);
    }
  }

  getDailyMonthly(
      {required String key,
      required String start_date,
      required String end_date,
      required String postal_code,
      required String country}) async {
    var result = await ApiCall().getDailyMonthly(
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
