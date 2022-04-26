import 'dart:convert';

import 'package:wheather_app/util/status.dart';

import '../../data/model/Wheather.dart';

import '../repo/GetWheatherRepo.dart';

class GetWeatherUseCases {
final GetWeatherRepo getWeatherRepo;
  List<Weather> _wheather_list = [];

  GetWeatherUseCases({required this.getWeatherRepo});


  Future<Status> getWeather({required String lat, required String lon}) async {
    var result = await getWeatherRepo.getWeather(lat: lat, lon: lon);

    if (result.code == 200) {
      var body = result.response.body;
      var wheather = Weather.fromJson(jsonDecode(body));
      _wheather_list.add(wheather);
      return Status(code: 200, response: _wheather_list);
    } else {
      return Status(response: result.response);
    }
  }
}