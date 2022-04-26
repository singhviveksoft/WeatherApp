import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SFCalender extends StatefulWidget {
  const SFCalender({Key? key}) : super(key: key);

  @override
  _SFCalenderState createState() => _SFCalenderState();
}

class _SFCalenderState extends State<SFCalender> {
  @override
  Widget build(BuildContext context) {
    return   SfCalendar(
      view: CalendarView.month,
      initialSelectedDate: DateTime.now(),

    );
  }
}
