import 'package:flutter/material.dart';

class screen1 extends StatefulWidget {
  screen1({Key key}) : super(key: key);

  @override
  _screen1State createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.green[400],
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightGreen,
            centerTitle: true,
            title: Text("Useful tools"),
            //backgroundColor: Colors.blue[300],
          ),
          body: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.green[400],
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                padding: EdgeInsets.all(8.0),
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Push bro");
                      Navigator.pushNamed(context, "weather");
                    },
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Color(0xffc7910a)),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/weatherHome.png'),
                            height: 60.0,
                          ),
                          Text("Weather",
                              style: TextStyle(color: Colors.black)),
                        ],
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "nepse");
                    },
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Color(0xffc7910a)),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/nepse.png'),
                            height: 80,
                          ),
                          Text("NEPSE", style: TextStyle(color: Colors.black)),
                        ],
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "rashifal");
                    },
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Color(0xffc7910a)),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/Horoscope.png"),
                            height: 80,
                          ),
                          Text("Rashifal",
                              style: TextStyle(color: Colors.black)),
                        ],
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "nasa");
                    },
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Color(0xffc7910a)),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/nasa.png"),
                            height: 80,
                          ),
                          Text("NASA", style: TextStyle(color: Colors.black)),
                        ],
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "corona");
                    },
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Color(0xffc7910a)),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/Corona.png"),
                            height: 80,
                          ),
                          Text("Corona", style: TextStyle(color: Colors.black)),
                        ],
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "ownpage");
                    },
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Color(0xffc7910a)),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/vegetable.png"),
                            height: 80,
                          ),
                          Text("Vegetable",
                              style: TextStyle(color: Colors.black)),
                        ],
                      )),
                    ),
                  ),
                ],
              ))),
    );
  }
}
