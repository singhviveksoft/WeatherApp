import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InternetRouting {
  bool manage_status = false;
  final Connectivity connectivity = Connectivity();
  StreamController controller = StreamController<bool>();
  StreamController controller2 = StreamController<DateTime>();
  late ConnectivityResult result;

  initConnectivity(BuildContext context) async {
    try {
      result = await connectivity.checkConnectivity();

      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        manage_status = false;
        controller.sink.add(manage_status);

      } else {
        manage_status = true;
        controller.sink.add(manage_status);

      }
    } on PlatformException catch (e) {
      manage_status = true;
      controller.sink.add(manage_status);
    }

  }

timer(){
  Timer.periodic(Duration(seconds: 2), (timer) {
    controller2.add(DateTime.now());
  });
}

}
