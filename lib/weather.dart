import 'package:flutter/material.dart';
import 'package:myappcomplete/logicModel/logic.dart';

class screen2 extends StatefulWidget {
  screen2({Key key}) : super(key: key);

  @override
  _screen2State createState() => _screen2State();
}

class _screen2State extends State<screen2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
            title: Text("${weeatherouput.cityname}",
                style: TextStyle(color: Colors.pink[200])),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "location").then((value) {
                    setState(() {});
                  });
                },
                icon: Icon(Icons.gps_fixed_rounded),
                color: Colors.blue[200],
              )
            ],
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Weather.png"),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        "TEMPERATURE:${weeatherouput.temp}",
                        style: TextStyle(fontSize: 20, color: Colors.white60),
                      )),
                  SizedBox(height: 8),
                  Text(
                    "${todayDateTime.datetime}",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 550),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Humidity",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "${weeatherouput.humidity}%",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Wind Speed",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "${weeatherouput.winspeed}mph",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text("Pressure",
                              style: TextStyle(color: Colors.white)),
                          Text(
                            "${weeatherouput.pressure} mm/hg",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
