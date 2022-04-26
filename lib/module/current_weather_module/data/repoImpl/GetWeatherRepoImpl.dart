import 'package:wheather_app/util/status.dart';

import '../../../monthly_weather_module/domain/repo/GetMonthlyWeatherRepo.dart';
import '../../domain/repo/GetWheatherRepo.dart';
import '../../../monthly_weather_module/data/datasource/remotedatasource/ApiCall.dart';

class GetWeatherRepoImpl extends GetWeatherRepo{
  final ApiCall apiCall;

  GetWeatherRepoImpl({required this.apiCall});
  @override
 Future<Status> getWeather({required String lat, required String lon})async  {
  Status status= await apiCall.getWeather(lat: lat, lon: lon);
  return status;
  }

}