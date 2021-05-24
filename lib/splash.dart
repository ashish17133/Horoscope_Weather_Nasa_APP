import 'package:flutter/material.dart';
import 'package:myappcomplete/logicModel/logic.dart';

bool checkData = true;

class screen0 extends StatefulWidget {
  screen0({Key key}) : super(key: key);

  @override
  _screen0State createState() => _screen0State();
}

class _screen0State extends State<screen0> {
  void getdataInitialize() async {
    //corona function
    GetCoronadata coronaoutput = GetCoronadata();
    await coronaoutput.getdata();

    //getdatetime
    await getdate();

    //nepse function
    Getnepse nepseoutput = Getnepse();
    await nepseoutput.getdata();

    //rashi function
    Getrashi rashioutput = Getrashi(rashiName: "Aries");
    await rashioutput.getdata();
    //nasa data
    Getnasa nasaoutput = Getnasa(year: 2021, month: 05, day: 11);
    await nasaoutput.getdata();
    //Weather data
    //dummy variable to make system await for data to load
    //dynamic datee = await getdate();

    Getweather weatheroutput = Getweather(cityname: "Kathmandu");
    dynamic result = await weatheroutput.getdata();
    //print(result);

    //for test only result value is set delete it later

    Vegpriceapi kalimati = Vegpriceapi();
    await kalimati.getdata();

    Future.delayed(
        Duration.zero, () => Navigator.pushReplacementNamed(context, "home"));
    // if (result != null) {
    //   print("push bro");
    //   Navigator.pushReplacementNamed(context, "home");
    // } else {
    //   print("No push bro no data");
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdataInitialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      home: Scaffold(
        body: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.green[400],
            child: Image(
              fit: BoxFit.scaleDown,
              image: AssetImage("assets/load.png"),
              color: Colors.black38,
            ),
          ),
          Center(
              child: Text(
            "Loading please wait..",
            style: TextStyle(fontSize: 20, color: Colors.yellow),
          )),
        ]),
      ),
    );
  }
}
