import 'package:flutter/material.dart';
import 'package:myappcomplete/logicModel/logic.dart';
import 'package:myappcomplete/logicModel/logicdataStore.dart';

String storeValue = "Aries";
//Rashi data class to store rashi value
Rashidata rashivalue = Rashidata();

class screen5 extends StatefulWidget {
  screen5({Key key}) : super(key: key);

  @override
  _screen5State createState() => _screen5State();
}

class _screen5State extends State<screen5> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Horoscope"),
          backgroundColor: Colors.lightGreen,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.green[400],
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Select your horoscope: "),
                    DropdownButton(
                      value: storeValue,
                      items: [
                        DropdownMenuItem(child: Text("Aries"), value: "Aries"),
                        DropdownMenuItem(
                            child: Text("Taurus"), value: "Taurus"),
                        DropdownMenuItem(
                            child: Text("Gemini"), value: "Gemini"),
                        DropdownMenuItem(
                            child: Text("Cancer"), value: "Cancer"),
                        DropdownMenuItem(child: Text("Leo"), value: "Leo"),
                        DropdownMenuItem(child: Text("Virgo"), value: "Virgo"),
                        DropdownMenuItem(child: Text("Libra"), value: "Libra"),
                        DropdownMenuItem(
                            child: Text("Scorpio"), value: "Scorpio"),
                        DropdownMenuItem(
                            child: Text("Sagittarius"), value: "Sagittarius"),
                        DropdownMenuItem(
                            child: Text("Capricon"), value: "Capricon"),
                        DropdownMenuItem(
                            child: Text("Aquarius"), value: "Aquarius"),
                      ],
                      onChanged: (value) async {
                        storeValue = value;
                        await changeFunction();
                        setState(() {});
                      },
                    )
                  ],
                ),
                SizedBox(height: 100),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(children: [
                            Text("Lucky Color:"),
                            Text("${rashivalue.luckyColor}")
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(children: [
                            Text("Lucky number:"),
                            Text("${rashivalue.luckynumber}")
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(children: [
                            Text("Lucky Time:"),
                            Text("${rashivalue.luckytime}")
                          ]),
                        ),
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(children: [
                              Text("Mood:"),
                              Text("${rashivalue.mood}")
                            ])),
                      ],
                    ),
                  ),
                  elevation: 20,
                ),
                Text("Description :",
                    style: TextStyle(
                        color: Colors.brown,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  height: 100,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("${rashivalue.description}")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void changeFunction() async {
  Getrashi rashivalue = Getrashi(rashiName: "$storeValue");
  await rashivalue.getdata();
}
