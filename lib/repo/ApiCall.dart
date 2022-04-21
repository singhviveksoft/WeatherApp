import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wheather_app/model/Wheather.dart';
import 'package:wheather_app/model/WheatherUpdateModel.dart';
import 'package:wheather_app/util/Constant.dart';
import 'package:wheather_app/util/status.dart';

import 'WheatherRepoMethod.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiCall implements WeatherRepoMethod {
  List<Wheather> wheather_list = [];

  @override
  getWeather({required String lat, required String lon}) async {
    try {
      var response = await http.get(Uri.parse(
          'https://api.weatherbit.io/v2.0/alerts?key=$api_key&lat=$lat&lon=$lon'));
         return Status(code: 200, response: response);
    } on HttpException {
      return Status(
        response: "Unable to retrieve HttpException.",
      );
    } on SocketException {
      return Status(response: "Unable to retrieve SocketException.");
    } on FormatException {
      return Status(response: "Unable to retrieve FormatException.");
    } catch (e) {
      return Status(response: "Unable to retrieve $e.");
    }
  }

  @override
  getDailyMonthly(
      {required String key,
      required String start_date,
      required String end_date,
      required String postal_code,
      required String country}) async {
    try {
      var response = await http.get(Uri.parse(
          'https://api.weatherbit.io/v2.0/history/daily?key=$key&start_date=$start_date&end_date=$end_date&postal_code=$postal_code&country=$country'));
      return Status(code: 200, response: response);
    } on HttpException {
      return Status(
        response: "Unable to retrieve HttpException.",
      );
    } on SocketException {
      return Status(response: "Unable to retrieve SocketException.");
    } on FormatException {
      return Status(response: "Unable to retrieve FormatException.");
    } catch (e) {
      return Status(response: "Unable to retrieve $e.");
    }
  }
}
