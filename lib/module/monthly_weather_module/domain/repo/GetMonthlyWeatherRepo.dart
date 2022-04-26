abstract class GetMonthlyWeatherRepo
{
  getMonthlyWeather(
      {required String key,
        required String start_date,
        required String end_date,
        required String postal_code,
        required String country}) {}
}