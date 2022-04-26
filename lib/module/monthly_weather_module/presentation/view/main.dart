import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheather_app/util/Palette.dart';
import 'package:wheather_app/module/current_weather_module/data/repoImpl/GetWeatherRepoImpl.dart';
import 'package:wheather_app/module/current_weather_module/domain/usecases/getwearherusescases.dart';
import 'package:wheather_app/module/monthly_weather_module/data/repoImpl/GetMonthlyWeatherRepoImpl.dart';
import 'package:wheather_app/module/monthly_weather_module/domain/usescases/getMonthlyWeatherUsescases.dart';
import 'package:wheather_app/module/monthly_weather_module/presentation/view/HomePage.dart';

import 'package:wheather_app/util/InternetMonitaring.dart';
import 'package:wheather_app/util/LocalNotificationService.dart';
import 'package:wheather_app/util/Routing.dart';
import 'package:wheather_app/util/provider/LocationProvider.dart';

import '../../../../util/provider/BottomBarProvider.dart';
import '../../data/datasource/remotedatasource/ApiCall.dart';
import '../modelview/provider/DailyMonthlyProvider.dart';
import '../../../current_weather_module/presentation/provider/WeatherProvider.dart';



Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [

          ChangeNotifierProvider<LocationProvider>(
            create: (context) {
              return LocationProvider();
            },
          ),
          ChangeNotifierProvider<WeatherProvider>(
            create: (context) {
              return WeatherProvider(getWeatherUseCases: GetWeatherUseCases(getWeatherRepo: GetWeatherRepoImpl(apiCall: ApiCall())));
            },
          ),
          ChangeNotifierProvider<DailyMonthlyProvider>(
            create: (context) {
              return DailyMonthlyProvider(getMonthlyWeatherUsesCases: GetMonthlyWeatherUsesCases(getMonthlyWeatherRepo: GetMonthlyWeatherRepoImpl(apiCall: ApiCall())));
            },
          ),
          ChangeNotifierProvider<BottomBarProvider>(
            create: (context) {
              return BottomBarProvider();
            },
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routing.generateRoute,
          initialRoute: Routing.home,
          theme: ThemeData(
            primarySwatch: Palette.white,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}
