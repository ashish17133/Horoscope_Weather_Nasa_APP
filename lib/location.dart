import 'package:flutter/material.dart';

import 'logicModel/logic.dart';
import 'weather.dart';
import 'weather.dart';

String textfieldvalue;

class Screen8 extends StatefulWidget {
  Screen8({Key key}) : super(key: key);

  @override
  _Screen8State createState() => _Screen8State();
}

class _Screen8State extends State<Screen8> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.green[400]),
          child: Center(
            child: TextField(
              onSubmitted: (value) {
                textfieldvalue = value;
              },
              onChanged: (value) {
                textfieldvalue = value;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                labelText: "Choose Location",
                hintText: "Input city location",
                suffixIcon: IconButton(
                  icon: Icon(Icons.forward),
                  onPressed: () async {
                    //create variable and store output value and check result to Navigator_pop since it is await
                    Getweather weatheroutput =
                        Getweather(cityname: textfieldvalue);

                    dynamic result = await weatheroutput.getdata();
                    if (result != null) {
                      Navigator.pop(context);
                      //print(textfieldvalue);

                    } else {
                      print("Wait");
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
