import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:wheather_app/Palette.dart';
import 'package:wheather_app/model/Wheather.dart';
import 'package:wheather_app/model/WheatherUpdateModel.dart';
import 'package:wheather_app/modelview/provider/BottomBarProvider.dart';
import 'package:wheather_app/modelview/provider/WeatherProvider.dart';
import 'package:wheather_app/repo/ApiCall.dart';
import 'package:wheather_app/modelview/provider/LocationProvider.dart';
import 'package:wheather_app/widgets/NavBar.dart';
import 'package:wheather_app/widgets/PageView.dart';
import 'package:wheather_app/widgets/Stack.dart';
import 'package:wheather_app/widgets/TableCalendar.dart';

import '../util/InternetMonitaring.dart';
import '../util/LocalNotificationService.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _online = false;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    _initialize();

    LocalNotificationService.initialize(context);

    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print('token---' + token!);
    });

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["route"];
        print('getInitialMessage' + routeFromMessage.toString());
        Navigator.pushNamed(context, routeFromMessage);
      }
    });

    ///forground work
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }

      LocalNotificationService.display(message);
    });

    ///When the app is in background but opened and user taps
    ///on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];

      print('onMessageOpenedApp' + routeFromMessage.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer<BottomBarProvider>(
        builder: (context, bottomBarProvider, child) {
          return Scaffold(
              bottomNavigationBar: _bottomNavigationBar(bottomBarProvider),
              body: Column(
                  children: [
                    Expanded(
                      child: PageView(
                          onPageChanged: _pageChanged,
                          controller: bottomBarProvider.pageController,
                          children: const [
                            StackWidget(),
                            Table_Calendar(),
                            Information()
                          ]),
                    ),
                    const Visibility(
                      visible: false,
                      child: SizedBox(

                        child:
                        Center(child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('No Internet'),
                        )),
                      ),
                    ),

                  ]));
        }


    ));
  }

  BottomNavigationBar _bottomNavigationBar(
      BottomBarProvider bottomBarProvider) =>
      BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline_rounded),
            label: 'Informaton',
          ),
        ],
        currentIndex: bottomBarProvider.index,
        selectedItemColor: bottomBarProvider.color,
        onTap: _onItemTapped,
      );

  void _onItemTapped(int index) {
    Provider.of<BottomBarProvider>(context, listen: false).getTap(index);

    /* setState(() {
      _selectedIndex = index;
    });*/
    /* _pageController.animateToPage(index,
        duration: Duration(
          milliseconds: 1000,
        ),
        curve: Curves.bounceIn);*/
  }

  void _pageChanged(int index) {
    Provider.of<BottomBarProvider>(context, listen: false).getTap(index);

    /* setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index,
        duration: Duration(
          milliseconds: 1000,
        ),
        curve: Curves.ease);*/
  }

  void _initialize() async {
    final internetRouting = InternetRouting();

 //   await internetRouting.initConnectivity(context);
     internetRouting.timer();
    internetRouting.controller2.stream.listen((event) {


        final snackBar = SnackBar(
            content:
            Text(event.toString()),
            backgroundColor: Colors.red);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

    });

/*_online= Provider.of<InternetRouting>(context, listen: false).manage_status;
 if(!_online){
   const snackBar =  SnackBar(
       content:
       Text("No Internet Connection"),
       backgroundColor: Colors.red);
   ScaffoldMessenger.of(context).showSnackBar(snackBar);
 }*/


  }


}