import 'package:flutter/material.dart';

import 'logicModel/logicdataStore.dart';

//create instance of nepse data to be stored in

Nepsedata nepsevalueStored = Nepsedata();

class screen4 extends StatefulWidget {
  screen4({Key key}) : super(key: key);

  @override
  _screen4State createState() => _screen4State();
}

class _screen4State extends State<screen4> {
  List<Widget> card = List<Widget>.generate(21, (index) => CountryRate(index));

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
          title: Text("Exchange Rate To NPR"),
          backgroundColor: Colors.lightGreen,
          elevation: 0,
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.green[400],
            child: ListView(
              children: card,
            )),
      ),
    );
  }
}

Widget CountryRate(index) {
  //print("${nepsevalueStored.storedNepse[0]['currency']['iso3']}");
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    color: Colors.white,
    shadowColor: Colors.black54,
    child: Column(
      children: [
        Text("${nepsevalueStored.storedNepse[index]['currency']['iso3']}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            children: [
              Text(
                "Buy",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                "${nepsevalueStored.storedNepse[index]['buy']}",
                style: TextStyle(fontSize: 12, color: Colors.black38),
              )
            ],
          ),
          Column(
            children: [
              Text(
                "Unit",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "${nepsevalueStored.storedNepse[index]['currency']['unit']}",
                style: TextStyle(color: Colors.black38, fontSize: 12),
              )
            ],
          ),
          Column(
            children: [
              Text(
                "Sell",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                "${nepsevalueStored.storedNepse[index]['sell']}",
                style: TextStyle(color: Colors.black38, fontSize: 12),
              )
            ],
          )
        ])
      ],
    ),
  );
}
