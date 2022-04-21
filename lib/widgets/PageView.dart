import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:wheather_app/model/Wheather.dart';
import 'package:wheather_app/modelview/provider/WeatherProvider.dart';
import 'package:wheather_app/repo/ApiCall.dart';
import 'package:wheather_app/repo/WeartherRepo.dart';
import 'package:wheather_app/modelview/provider/LocationProvider.dart';
import 'package:wheather_app/util/status.dart';
import 'package:wheather_app/view/IndiaWheatherView.dart';
import 'package:wheather_app/view/LondonWheatherView.dart';
import 'package:wheather_app/view/TokyoWheatherView.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  State<Information> createState() => _PageViewWidget();
}

class _PageViewWidget extends State<Information> {
  var index = 0;
  List<Wheather> wheather_list = [];
  var latitude;
  var longitude;
  bool status = false;
  int count_status = 1;
  LocationPermission? _permission;
  Position? _location;

  void _initialize() async {
    await Provider.of<LocationProvider>(context, listen: false)
        .checkPermission();
    status =
        Provider.of<LocationProvider>(context, listen: false).permission_status;
    _location = Provider.of<LocationProvider>(context, listen: false).location;
    if (status) {
      getWeather(_location);
    } else {
      createSnackBar('required location permission', context);
    }
  }

  getWeather(Position? _location) {
    Provider.of<WeatherProvider>(context, listen: false).addWeatherDetail(
        lat: _location?.latitude.toString() ?? '0.0',
        lon: _location?.longitude.toString() ?? '0.0');
    wheather_list =
        Provider.of<WeatherProvider>(context, listen: false).wheather_list_type;
  }

  void createSnackBar(String message, BuildContext scaffoldContext) {
    final snackBar =
        SnackBar(content: Text(message), backgroundColor: Colors.red);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    Scaffold.of(scaffoldContext).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            Consumer<WeatherProvider>(builder: (context, weatherProvider, child) {
          return weatherProvider.wheather_list_type.length>0?
            _page_view(weatherProvider): Center(
            child: SizedBox(
                width: 100,
                height: 150,
                child: Column(
                  children: [
                    const CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                    ),
                    Expanded(child: Text(weatherProvider.error_type))
                  ],
                )),
          );
        }),
      ),
    );
  }

  PageView _page_view(WeatherProvider provider) => PageView(
        onPageChanged: (i) {
          setState(() {
            index = i;
          });
        },
        children: const [
          IndiaWheatherView(),
          LondonWheatherView(),
          TokyoWheatherView()
        ],
      );

  @override
  void initState() {
    _initialize();
/*    Provider.of<Location>(context, listen: false)
        .controller
        .stream
        .listen((event) {
      if (event == LocationPermission.denied ||
          event == LocationPermission.deniedForever) {
       // createSnackBar('required location permission', context);
      } else {
      //  getWeather(event);
      }

      print(event);
    });*/

    super.initState();
  }
}
