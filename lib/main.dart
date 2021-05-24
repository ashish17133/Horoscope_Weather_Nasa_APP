import 'package:flutter/material.dart';
import 'package:myappcomplete/rashifal.dart';
import 'package:myappcomplete/splash.dart';
import 'package:myappcomplete/weather.dart';

import 'corona.dart';
import 'home.dart';
import 'location.dart';
import 'nasa.dart';
import 'nepse.dart';
import 'vegetable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) {
          return screen0();
        },
        'home': (context) {
          return screen1();
        },
        'weather': (context) {
          return screen2();
        },
        'corona': (context) {
          return screen3();
        },
        'nepse': (context) {
          return screen4();
        },
        'rashifal': (context) {
          return screen5();
        },
        'nasa': (context) {
          return screen6();
        },
        'ownpage': (context) {
          return screen7();
        },
        'location': (context) {
          return Screen8();
        },
        'nasadataDisplay': (context) {
          return screen9();
        }
      },
    );
  }
}
