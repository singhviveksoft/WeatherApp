import 'package:flutter/material.dart';
class Palette {
  static const MaterialColor white = MaterialColor(
    0xffFFFFFF, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffffffff ),//10%
      100: Color(0xfffafafa),//20%
      200: Color(0xfff5f5f5),//30%
      300: Color(0xfff0f0f0),//40%
      400: Color(0xffdedede),//50%
      500: Color(0xffc2c2c2),//60%
      600: Color(0xff979797),//70%
      700: Color(0xff818181),//80%
      800: Color(0xff606060),//90%
      900: Color(0xff3c3c3c),//100%
    },
  );
}