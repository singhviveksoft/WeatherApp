/// data : [{"rh":68,"pod":"n","lon":-78.64,"pres":994.2,"timezone":"America/New_York","ob_time":"2022-03-25 10:30","country_code":"US","clouds":25,"ts":1648204200,"solar_rad":0,"state_code":"NC","city_name":"Raleigh","wind_spd":1.34,"wind_cdir_full":"west-southwest","wind_cdir":"WSW","slp":1006.4,"vis":10,"h_angle":-90,"sunset":"23:30","dni":0,"dewpt":7.7,"snow":0,"uv":0,"precip":0,"wind_dir":250,"sunrise":"11:10","ghi":0,"dhi":0,"aqi":33,"lat":35.78,"weather":{"icon":"c02n","code":801,"description":"Few clouds"},"datetime":"2022-03-25:10","temp":13.4,"station":"1327W","elev_angle":-3.03,"app_temp":13.5}]
/// count : 1

class WheatherUpdateModel {
  WheatherUpdateModel({
      List<Data>? data, 
      dynamic? count,}){
    _data = data;
    _count = count;
}

  WheatherUpdateModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _count = json['count'];
  }
  List<Data>? _data;
  dynamic? _count;

  List<Data>? get data => _data;
  dynamic? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }

}

/// rh : 68
/// pod : "n"
/// lon : -78.64
/// pres : 994.2
/// timezone : "America/New_York"
/// ob_time : "2022-03-25 10:30"
/// country_code : "US"
/// clouds : 25
/// ts : 1648204200
/// solar_rad : 0
/// state_code : "NC"
/// city_name : "Raleigh"
/// wind_spd : 1.34
/// wind_cdir_full : "west-southwest"
/// wind_cdir : "WSW"
/// slp : 1006.4
/// vis : 10
/// h_angle : -90
/// sunset : "23:30"
/// dni : 0
/// dewpt : 7.7
/// snow : 0
/// uv : 0
/// precip : 0
/// wind_dir : 250
/// sunrise : "11:10"
/// ghi : 0
/// dhi : 0
/// aqi : 33
/// lat : 35.78
/// weather : {"icon":"c02n","code":801,"description":"Few clouds"}
/// datetime : "2022-03-25:10"
/// temp : 13.4
/// station : "1327W"
/// elev_angle : -3.03
/// app_temp : 13.5

class Data {
  Data({
      int? rh, 
      String? pod, 
      dynamic? lon, 
      dynamic? pres, 
      String? timezone, 
      String? obTime, 
      String? countryCode, 
      int? clouds, 
      int? ts, 
      int? solarRad, 
      String? stateCode, 
      String? cityName, 
      dynamic? windSpd, 
      String? windCdirFull, 
      String? windCdir, 
      dynamic? slp, 
      int? vis, 
      int? hAngle, 
      String? sunset, 
      int? dni, 
      dynamic? dewpt, 
      int? snow, 
      int? uv, 
      int? precip, 
      int? windDir, 
      String? sunrise, 
      int? ghi, 
      int? dhi, 
      int? aqi, 
      dynamic? lat, 
      Weather? weather, 
      String? datetime, 
      dynamic? temp, 
      String? station, 
      dynamic? elevAngle, 
      dynamic? appTemp,}){
    _rh = rh;
    _pod = pod;
    _lon = lon;
    _pres = pres;
    _timezone = timezone;
    _obTime = obTime;
    _countryCode = countryCode;
    _clouds = clouds;
    _ts = ts;
    _solarRad = solarRad;
    _stateCode = stateCode;
    _cityName = cityName;
    _windSpd = windSpd;
    _windCdirFull = windCdirFull;
    _windCdir = windCdir;
    _slp = slp;
    _vis = vis;
    _hAngle = hAngle;
    _sunset = sunset;
    _dni = dni;
    _dewpt = dewpt;
    _snow = snow;
    _uv = uv;
    _precip = precip;
    _windDir = windDir;
    _sunrise = sunrise;
    _ghi = ghi;
    _dhi = dhi;
    _aqi = aqi;
    _lat = lat;
    _weather = weather;
    _datetime = datetime;
    _temp = temp;
    _station = station;
    _elevAngle = elevAngle;
    _appTemp = appTemp;
}

  Data.fromJson(dynamic json) {
    _rh = json['rh'];
    _pod = json['pod'];
    _lon = json['lon'];
    _pres = json['pres'];
    _timezone = json['timezone'];
    _obTime = json['ob_time'];
    _countryCode = json['country_code'];
    _clouds = json['clouds'];
    _ts = json['ts'];
    _solarRad = json['solar_rad'];
    _stateCode = json['state_code'];
    _cityName = json['city_name'];
    _windSpd = json['wind_spd'];
    _windCdirFull = json['wind_cdir_full'];
    _windCdir = json['wind_cdir'];
    _slp = json['slp'];
    _vis = json['vis'];
    _hAngle = json['h_angle'];
    _sunset = json['sunset'];
    _dni = json['dni'];
    _dewpt = json['dewpt'];
    _snow = json['snow'];
    _uv = json['uv'];
    _precip = json['precip'];
    _windDir = json['wind_dir'];
    _sunrise = json['sunrise'];
    _ghi = json['ghi'];
    _dhi = json['dhi'];
    _aqi = json['aqi'];
    _lat = json['lat'];
    _weather = json['weather'] != null ? Weather.fromJson(json['weather']) : null;
    _datetime = json['datetime'];
    _temp = json['temp'];
    _station = json['station'];
    _elevAngle = json['elev_angle'];
    _appTemp = json['app_temp'];
  }
  int? _rh;
  String? _pod;
  dynamic? _lon;
  dynamic? _pres;
  String? _timezone;
  String? _obTime;
  String? _countryCode;
  int? _clouds;
  int? _ts;
  int? _solarRad;
  String? _stateCode;
  String? _cityName;
  dynamic? _windSpd;
  String? _windCdirFull;
  String? _windCdir;
  dynamic? _slp;
  int? _vis;
  int? _hAngle;
  String? _sunset;
  int? _dni;
  dynamic? _dewpt;
  int? _snow;
  int? _uv;
  int? _precip;
  int? _windDir;
  String? _sunrise;
  int? _ghi;
  int? _dhi;
  int? _aqi;
  dynamic? _lat;
  Weather? _weather;
  String? _datetime;
  dynamic? _temp;
  String? _station;
  dynamic? _elevAngle;
  dynamic? _appTemp;

  int? get rh => _rh;
  String? get pod => _pod;
  dynamic? get lon => _lon;
  dynamic? get pres => _pres;
  String? get timezone => _timezone;
  String? get obTime => _obTime;
  String? get countryCode => _countryCode;
  int? get clouds => _clouds;
  int? get ts => _ts;
  int? get solarRad => _solarRad;
  String? get stateCode => _stateCode;
  String? get cityName => _cityName;
  dynamic? get windSpd => _windSpd;
  String? get windCdirFull => _windCdirFull;
  String? get windCdir => _windCdir;
  dynamic? get slp => _slp;
  int? get vis => _vis;
  int? get hAngle => _hAngle;
  String? get sunset => _sunset;
  int? get dni => _dni;
  dynamic? get dewpt => _dewpt;
  int? get snow => _snow;
  int? get uv => _uv;
  int? get precip => _precip;
  int? get windDir => _windDir;
  String? get sunrise => _sunrise;
  int? get ghi => _ghi;
  int? get dhi => _dhi;
  int? get aqi => _aqi;
  dynamic? get lat => _lat;
  Weather? get weather => _weather;
  String? get datetime => _datetime;
  dynamic? get temp => _temp;
  String? get station => _station;
  dynamic? get elevAngle => _elevAngle;
  dynamic? get appTemp => _appTemp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rh'] = _rh;
    map['pod'] = _pod;
    map['lon'] = _lon;
    map['pres'] = _pres;
    map['timezone'] = _timezone;
    map['ob_time'] = _obTime;
    map['country_code'] = _countryCode;
    map['clouds'] = _clouds;
    map['ts'] = _ts;
    map['solar_rad'] = _solarRad;
    map['state_code'] = _stateCode;
    map['city_name'] = _cityName;
    map['wind_spd'] = _windSpd;
    map['wind_cdir_full'] = _windCdirFull;
    map['wind_cdir'] = _windCdir;
    map['slp'] = _slp;
    map['vis'] = _vis;
    map['h_angle'] = _hAngle;
    map['sunset'] = _sunset;
    map['dni'] = _dni;
    map['dewpt'] = _dewpt;
    map['snow'] = _snow;
    map['uv'] = _uv;
    map['precip'] = _precip;
    map['wind_dir'] = _windDir;
    map['sunrise'] = _sunrise;
    map['ghi'] = _ghi;
    map['dhi'] = _dhi;
    map['aqi'] = _aqi;
    map['lat'] = _lat;
    if (_weather != null) {
      map['weather'] = _weather?.toJson();
    }
    map['datetime'] = _datetime;
    map['temp'] = _temp;
    map['station'] = _station;
    map['elev_angle'] = _elevAngle;
    map['app_temp'] = _appTemp;
    return map;
  }

}

/// icon : "c02n"
/// code : 801
/// description : "Few clouds"

class Weather {
  Weather({
      String? icon, 
      int? code, 
      String? description,}){
    _icon = icon;
    _code = code;
    _description = description;
}

  Weather.fromJson(dynamic json) {
    _icon = json['icon'];
    _code = json['code'];
    _description = json['description'];
  }
  String? _icon;
  int? _code;
  String? _description;

  String? get icon => _icon;
  int? get code => _code;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['icon'] = _icon;
    map['code'] = _code;
    map['description'] = _description;
    return map;
  }

}