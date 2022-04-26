import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wheather_app/module/monthly_weather_module/presentation/widgets/BottomSheet.dart';
import 'package:wheather_app/module/monthly_weather_module/presentation/widgets/PageView.dart';
import 'package:wheather_app/module/monthly_weather_module/presentation/widgets/Stack.dart';
import 'package:wheather_app/module/monthly_weather_module/presentation/widgets/TableCalendar.dart';

import '../module/monthly_weather_module/presentation/view/WeatherDetailView.dart';




class Routing {
  static const String home = '/';
  static const String weather_detail = '/weather_detail';
  static const String table_calender = '/table_calender';
  static const String information = '/information';
  static const String Exit = 'Exit';



  static Route<dynamic> generateRoute(RouteSettings settings) {
    var valuePassed;
    if(settings.arguments!=null){
      valuePassed=settings.arguments  as  Map<String,dynamic>;
    }

    switch (settings.name) {
     case home:
        return MaterialPageRoute(
          builder: (context) {
            return StackWidget();
          },
        );
      break;

      case weather_detail:
        return MaterialPageRoute(
          builder: (context) {
            return const WeatherDetailView();
          },
        );
      case table_calender:
        return MaterialPageRoute(
          builder: (context) {
            return const Table_Calendar();
          },
        );

      case information:
        return MaterialPageRoute(
          builder: (context) {
            return const Information();
          },
        );

      case Exit:
        return MaterialPageRoute(
          builder: (context) {
            return BottomSheetWidget();
          },
        );

      default:
        throw 'no screen';
    }
  }


}