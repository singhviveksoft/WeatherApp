class WeatherEntities {

  final String countryCode;
  final double lon;
  final String timezone;
  final double lat;

  final String cityName;
  final String stateCode;

  WeatherEntities(
      {required this.countryCode, required this.lon, required this.timezone, required this.lat, required this.cityName, required this.stateCode});

}