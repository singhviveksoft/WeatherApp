import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wheather_app/modelview/provider/DailyMonthlyProvider.dart';

class Table_Calendar extends StatefulWidget {
  const Table_Calendar({Key? key}) : super(key: key);

  @override
  _Table_Calendar_State createState() => _Table_Calendar_State();
}

class _Table_Calendar_State extends State<Table_Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Consumer<DailyMonthlyProvider>(
        builder: (context, weatherProvider, child) {
      return weatherProvider.list.length > 0
          ? Column(children: [
              _table_calendar(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Center(
                      child: Text(
                    weatherProvider.list[0].countryCode.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  )),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color(0xff123456),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Center(
                      child: Text(
                    weatherProvider.list[0].timezone.toString(),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  )),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.redAccent,
                  ),
                )
              ]),
              const SizedBox(
                height: 50,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Center(
                      child: Text(
                    weatherProvider.list[0].cityName.toString(),
                    style: TextStyle(
                      color: Color(0xff123456),
                      fontSize: 25.0,
                    ),
                  )),
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Center(
                      child: Text(
                    weatherProvider.list[0].data?[0].temp.toString() ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.redAccent,
                  ),
                )
              ])
            ])
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
    })));
  }

  TableCalendar _table_calendar() => TableCalendar(
        calendarFormat: _calendarFormat,
        focusedDay: _focusedDay,
        firstDay: DateTime(1990),
        lastDay: DateTime(2050),
        calendarStyle: const CalendarStyle(
          isTodayHighlighted: true,
          selectedDecoration:
              BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          selectedTextStyle: TextStyle(color: Colors.white),
        ),
        onFormatChanged: (CalendarFormat format) {
          setState(() {
            _calendarFormat = format;
          });
        },
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay; // update `_focusedDay` here as well
          });
        },
      );
}
