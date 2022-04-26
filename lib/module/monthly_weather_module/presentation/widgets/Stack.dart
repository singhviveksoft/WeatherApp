import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheather_app/module/monthly_weather_module/presentation/modelview/provider/DailyMonthlyProvider.dart';
import 'package:wheather_app/module/monthly_weather_module/presentation/widgets/Imageslider.dart';

import 'package:wheather_app/util/Constant.dart';



import 'HorizontalListView.dart';
import 'NavBar.dart';

class StackWidget extends StatefulWidget {
  const StackWidget({Key? key}) : super(key: key);

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        body: Consumer<DailyMonthlyProvider>(
            builder: (context, weatherProvider, child) {
          return weatherProvider.list.length > 0
              ? Stack(
                  children: [
                    Visibility(
                      visible: false,
                      child: Container(
                        color: const Color(0xffe0e0e0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Icon(Icons.home_outlined,
                                      size: 40, color: Color(0xff123456)),
                                  Icon(Icons.update,
                                      size: 40, color: Color(0xff123456)),
                                  Icon(Icons.home_outlined,
                                      size: 40, color: Color(0xff123456))
                                ]),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(children: const [
                          SizedBox(
                            height: 270,
                          ),
                          Expanded(child: ImageSlider()),
                          Expanded(child: HorizontalListView())
                        ])),
                    Container(
                      height: 200,
                      decoration: const BoxDecoration(
                          color: Color(0xff123456),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0))),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Visibility(
                              visible: true,
                              child: Builder(builder: (context) {
                                return InkWell(
                                  onTap: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  child: const Icon(
                                    Icons.menu_outlined,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                );
                              }),
                            ),
                            Icon(
                              Icons.more_horiz_outlined,
                              size: 40,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0, top: 8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              weatherProvider.list[0].countryCode.toString(),
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ),
                        )
                      ]),
                    ),
                    Positioned(
                        top: 120,
                        left: 10,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          child: Card(
                            child: Image.asset(
                              'images/weather_5.jpg',
                              width: 100,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                  ],
                )
              : Center(
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
        }));
  }

  void createSnackBar(String message, BuildContext scaffoldContext) {
    final snackBar =
        SnackBar(content: Text(error), backgroundColor: Colors.red);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    Scaffold.of(scaffoldContext).showSnackBar(snackBar);
  }

  void _initialize() {
    Provider.of<DailyMonthlyProvider>(context, listen: false).getDailyMonthly(
        key: api_key,
        start_date: '2022-03-01',
        end_date: '2022-03-30',
        postal_code: '411017',
        country: 'IN');

    Provider.of<DailyMonthlyProvider>(context, listen: false).list;
    error =
        Provider.of<DailyMonthlyProvider>(context, listen: false).error_type;
  }

  @override
  void initState() {
    _initialize();
    super.initState();
  }
}
