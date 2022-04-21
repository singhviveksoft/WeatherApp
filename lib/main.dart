import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheather_app/repo/ApiCall.dart';
import 'package:wheather_app/modelview/provider/LocationProvider.dart';
import 'package:wheather_app/util/InternetMonitaring.dart';
import 'package:wheather_app/util/LocalNotificationService.dart';
import 'package:wheather_app/util/Routing.dart';

import 'modelview/provider/BottomBarProvider.dart';
import 'modelview/provider/DailyMonthlyProvider.dart';
import 'modelview/provider/WeatherProvider.dart';
import 'view/HomePage.dart';
import 'Palette.dart';

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
              return WeatherProvider();
            },
          ),
          ChangeNotifierProvider<DailyMonthlyProvider>(
            create: (context) {
              return DailyMonthlyProvider();
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
