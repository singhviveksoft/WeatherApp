import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheather_app/util/Palette.dart';
import 'package:wheather_app/module/current_weather_module/presentation/provider/WeatherProvider.dart';

import 'package:wheather_app/util/Routing.dart';





class IndiaWheatherView extends StatefulWidget {


  const IndiaWheatherView(
      {Key? key})
      : super(key: key);

  @override
  _IndiaWheatherViewState createState() => _IndiaWheatherViewState();
}

class _IndiaWheatherViewState extends State<IndiaWheatherView> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.pushNamed(context, Routing.weather_detail);
      },
      child:
      Consumer<WeatherProvider>(
        builder: (context, apiCall, child) {
          return
            apiCall.wheather_list_type.isNotEmpty?
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
                    ),
                    fit: BoxFit.cover),
              ),
              child:  Column(
                children: [
                  Text(
                    apiCall.wheather_list_type[0].countryCode.toString(),
                    style: TextStyle(fontSize: 25.0, color: Palette.white[100]),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 100.0),
                        child: Text(
                          apiCall.wheather_list_type[0].cityName.toString(),
                          style:
                          TextStyle(fontSize: 45.0, color: Palette.white[100]),
                        ),
                      ),
                    ),
                  ),
                ],
              )


          ): const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                ));
        },

      ),
    );
  }
}
