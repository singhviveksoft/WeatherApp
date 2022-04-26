

/// timezone : "Asia/Kolkata"
/// state_code : "16"
/// country_code : "IN"
/// lat : 18.5732
/// lon : 73.8739
/// city_name : "Khadki"
/// station_id : "430630-99999"
/// data : [{"rh":47.5,"max_wind_spd_ts":1646204400,"t_ghi":6939.4,"max_wind_spd":3.2,"solar_rad":267.3,"wind_gust_spd":3.2,"max_temp_ts":1646211600,"min_temp_ts":1646179200,"clouds":24,"max_dni":961.1,"precip_gpm":0,"wind_spd":1.6,"slp":1012.5,"ts":1646159400,"max_ghi":980.6,"temp":24.6,"pres":950.3,"dni":379.5,"dewpt":11,"snow":0,"dhi":46.6,"precip":0,"wind_dir":111,"max_dhi":124.4,"ghi":289.1,"max_temp":34,"t_dni":9107.4,"max_uv":8.7,"t_dhi":1118.4,"datetime":"2022-03-02","t_solar_rad":6414.1,"min_temp":14.9,"max_wind_dir":111,"snow_depth":null},{"rh":45.1,"max_wind_spd_ts":1646254800,"t_ghi":6971.4,"max_wind_spd":3.6,"solar_rad":236.6,"wind_gust_spd":3.6,"max_temp_ts":1646298000,"min_temp_ts":1646265600,"clouds":28,"max_dni":961.4,"precip_gpm":0,"wind_spd":2.3,"slp":1011.7,"ts":1646245800,"max_ghi":983.8,"temp":25.9,"pres":949.9,"dni":380.3,"dewpt":11.1,"snow":0,"dhi":46.7,"precip":0,"wind_dir":90,"max_dhi":124.5,"ghi":290.5,"max_temp":34.8,"t_dni":9126.3,"max_uv":7.1,"t_dhi":1121,"datetime":"2022-03-03","t_solar_rad":5677.2,"min_temp":16.2,"max_wind_dir":90,"snow_depth":null},{"rh":45.2,"max_wind_spd_ts":1646406000,"t_ghi":7003.1,"max_wind_spd":2.8,"solar_rad":259,"wind_gust_spd":2.8,"max_temp_ts":1646384400,"min_temp_ts":1646352000,"clouds":28,"max_dni":961.7,"precip_gpm":0,"wind_spd":1.1,"slp":1011.9,"ts":1646332200,"max_ghi":987,"temp":25.2,"pres":950.9,"dni":397.6,"dewpt":11,"snow":0,"dhi":48.9,"precip":0,"wind_dir":144,"max_dhi":124.6,"ghi":304.5,"max_temp":34.2,"t_dni":9144.8,"max_uv":8.5,"t_dhi":1123.7,"datetime":"2022-03-04","t_solar_rad":5956.1,"min_temp":15.8,"max_wind_dir":144,"snow_depth":null}]
/// sources : ["430630-99999","IN012190100","IN012191800","IN012190600","imerg","merra2","era5","modis"]
/// city_id : "1267195"

class DailyWeather  {

  DailyWeather({
    String? timezone,
    String? stateCode,
    String? countryCode,
    String? cityName,
    String? stationId,
    List<Data>? data,
    List<String>? sources,
    String? cityId,
  }) {
    _timezone = timezone;
    _stateCode = stateCode;
    _countryCode = countryCode;

    _cityName = cityName;
    _stationId = stationId;
    _data = data;
    _sources = sources;
    _cityId = cityId;
  }

  DailyWeather.fromJson(dynamic json) {
    _timezone = json['timezone'];
    _stateCode = json['state_code'];
    _countryCode = json['country_code'];

    _cityName = json['city_name'];
    _stationId = json['station_id'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _sources = json['sources'] != null ? json['sources'].cast<String>() : [];
    _cityId = json['city_id'];
  }

  String? _timezone;
  String? _stateCode;
  String? _countryCode;

  String? _cityName;
  String? _stationId;
  List<Data>? _data;
  List<String>? _sources;
  String? _cityId;

  String? get timezone => _timezone;

  String? get stateCode => _stateCode;

  String? get countryCode => _countryCode;

  String? get cityName => _cityName;

  String? get stationId => _stationId;

  List<Data>? get data => _data;

  List<String>? get sources => _sources;

  String? get cityId => _cityId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timezone'] = _timezone;
    map['state_code'] = _stateCode;
    map['country_code'] = _countryCode;

    map['city_name'] = _cityName;
    map['station_id'] = _stationId;

    map['sources'] = _sources;
    map['city_id'] = _cityId;
    return map;
  }
}

/// rh : 47.5
/// max_wind_spd_ts : 1646204400
/// t_ghi : 6939.4
/// max_wind_spd : 3.2
/// solar_rad : 267.3
/// wind_gust_spd : 3.2
/// max_temp_ts : 1646211600
/// min_temp_ts : 1646179200
/// clouds : 24
/// max_dni : 961.1
/// precip_gpm : 0
/// wind_spd : 1.6
/// slp : 1012.5
/// ts : 1646159400
/// max_ghi : 980.6
/// temp : 24.6
/// pres : 950.3
/// dni : 379.5
/// dewpt : 11
/// snow : 0
/// dhi : 46.6
/// precip : 0
/// wind_dir : 111
/// max_dhi : 124.4
/// ghi : 289.1
/// max_temp : 34
/// t_dni : 9107.4
/// max_uv : 8.7
/// t_dhi : 1118.4
/// datetime : "2022-03-02"
/// t_solar_rad : 6414.1
/// min_temp : 14.9
/// max_wind_dir : 111
/// snow_depth : null

class Data {
  Data({double? temp,String? datetime}) {
    _temp = temp;


    _datetime = datetime;
  }

  Data.fromJson(dynamic json) {
    _datetime = json['datetime'];
    _temp = json['temp'];
  }

  double? _temp;
  double? _pres;

  String? _datetime;

  double? get temp => _temp;

  double? get pres => _pres;

  String? get datetime => _datetime;
}
