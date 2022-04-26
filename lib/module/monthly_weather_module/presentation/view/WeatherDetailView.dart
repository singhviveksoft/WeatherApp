import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../widgets/Stack.dart';

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





