/// country_code : "US"
/// lon : -78.64
/// timezone : "America/New_York"
/// lat : 35.78
/// alerts : []
/// city_name : "Raleigh"
/// state_code : "NC"

class Wheather {
  Wheather({
      String? countryCode, 
      double? lon, 
      String? timezone, 
      double? lat, 

      String? cityName, 
      String? stateCode,}){
    _countryCode = countryCode;
    _lon = lon;
    _timezone = timezone;
    _lat = lat;

    _cityName = cityName;
    _stateCode = stateCode;
}

  Wheather.fromJson(dynamic json) {
    _countryCode = json['country_code'];
    _lon = json['lon'];
    _timezone = json['timezone'];
    _lat = json['lat'];

    _cityName = json['city_name'];
    _stateCode = json['state_code'];
  }
  String? _countryCode;
  double? _lon;
  String? _timezone;
  double? _lat;

  String? _cityName;
  String? _stateCode;

  String? get countryCode => _countryCode;
  double? get lon => _lon;
  String? get timezone => _timezone;
  double? get lat => _lat;

  String? get cityName => _cityName;
  String? get stateCode => _stateCode;



}