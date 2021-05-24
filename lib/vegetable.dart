import 'package:flutter/material.dart';
import 'package:myappcomplete/logicModel/logic.dart';
import 'package:myappcomplete/logicModel/logicdataStore.dart';

//creating intsance of vegetable class to store value

class screen7 extends StatefulWidget {
  screen7({Key key}) : super(key: key);

  @override
  _screen7State createState() => _screen7State();
}

class _screen7State extends State<screen7> {
  List<Widget> card = List<Widget>.generate(120, (index) => carde(index));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text("Kalimati Vegetable Price"),
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

Widget carde(index) {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${kalimativeg.values[index]['commodityName']}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Retail Price:${kalimativeg.values[index]['retailPrice']}"),
              Text(
                  "Whole Sale Price:${kalimativeg.values[index]['wholesalePrice']}")
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    ),
  );
}
