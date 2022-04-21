import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheather_app/model/DailyWeather.dart';
import 'package:wheather_app/modelview/provider/DailyMonthlyProvider.dart';
import 'package:wheather_app/util/Constant.dart';

class HorizontalListView extends StatefulWidget {
  const HorizontalListView({Key? key}) : super(key: key);

  @override
  State<HorizontalListView> createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  List<DailyWeather> _list = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<DailyMonthlyProvider>(
        builder: (context, weatherProvider, child) {
      return SizedBox(
        height: 200,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 100,
              padding: EdgeInsets.all(10.0),
              child: Stack(children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: AspectRatio(
                              aspectRatio: 4 / 3,
                              child: Container(
                                color: Color(0xff123456),

                              ),
                            ),
                          ),
                        ),
                        /* Text('ddddddddddddddddddd'),
                        const Text(
                            'ddddddddddddddddddddgggggggggggggggggggggfffffffffffffffffffffffffffffffffffffffffffffffff'),*/
                      ]),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 60.0),
                    child: Text(
                      weatherProvider.list[0].data?[index].datetime
                              .toString() ??
                          '°C',
                      style: const TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 13.0),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 60.0, 8.0, 5.0),
                    child: Text(
                      weatherProvider.list[0].data?[index].temp.toString() ??
                          '0.0',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 25.0),
                    ),
                  ),
                ),
              ]),
            );
          },
          itemCount: weatherProvider.list[0].data?.length ?? 0,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 1,
            );
          },
        ),
      );
    });
  }
}
