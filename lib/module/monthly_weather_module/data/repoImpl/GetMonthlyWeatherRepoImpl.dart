import 'package:wheather_app/util/status.dart';

import '../../domain/repo/GetMonthlyWeatherRepo.dart';
import '../datasource/remotedatasource/ApiCall.dart';

class GetMonthlyWeatherRepoImpl extends GetMonthlyWeatherRepo {

  final ApiCall apiCall;

  GetMonthlyWeatherRepoImpl({required this.apiCall});
  @override
Future<Status>  getMonthlyWeather (
      {required String key,
      required String start_date,
      required String end_date,
      required String postal_code,
      required String country}) async{
Status status=await  apiCall.getMonthlyWeather(key: key, start_date: start_date, end_date: end_date, postal_code: postal_code, country: country);
return status;
  }
}
