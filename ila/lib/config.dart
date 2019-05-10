import 'package:flutter/material.dart';

class Config {
  static const AppTitle = 'ILA';
  static const Map<int, Color> _PrimaryColors =
  {
    50:Color.fromARGB(26, 230, 25, 29),
    100:Color.fromARGB(51, 230, 25, 29),
    200:Color.fromARGB(77, 230, 25, 29),
    300:Color.fromARGB(102, 230, 25, 29),
    400:Color.fromARGB(128, 230, 25, 29),
    500:Color.fromARGB(153, 230, 25, 29),
    600:Color.fromARGB(179, 230, 25, 29),
    700:Color.fromARGB(204, 230, 25, 29),
    800:Color.fromARGB(230, 230, 25, 29),
    900:Color.fromARGB(255, 230, 25, 29),
  };
  static const PrimaryColor = MaterialColor(0xffe6191d,_PrimaryColors);
  static const AppColorDark = Colors.black;



  static const SplashScreenDuration = 10;
}
