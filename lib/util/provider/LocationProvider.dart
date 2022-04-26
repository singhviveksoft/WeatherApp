import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class LocationProvider with ChangeNotifier{
  LocationPermission? permission;
  Position? location;
  StreamController controller = StreamController();
  bool permission_status=false;

  checkPermission() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      permission_status=false;
      if (permission == LocationPermission.whileInUse) {
        await addLocation();
      }
      notifyListeners();
    //  controller.sink.add(permission);
    } else {
      await addLocation();
    //  controller.sink.add(permission);
    }
  }

  addLocation() async {
    location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    permission_status=true;
    print('latitude-- ${location?.latitude ?? '0.0'}');
    print('longitude-- ${location?.longitude ?? '0.0'}');
    notifyListeners();
  }
}
