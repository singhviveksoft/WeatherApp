import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wheather_app/widgets/HorizontalListView.dart';
import 'package:wheather_app/widgets/ListView.dart';
import 'package:wheather_app/widgets/Sliver.dart';
import 'package:wheather_app/widgets/Stack.dart';

class WeatherDetailView extends StatefulWidget {
  const WeatherDetailView({Key? key}) : super(key: key);

  @override
  _WeatherDetailViewState createState() => _WeatherDetailViewState();
}

class _WeatherDetailViewState extends State<WeatherDetailView> {
  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child: Scaffold(
        body:
        StackWidget(),
      ),
    );
  }
}





