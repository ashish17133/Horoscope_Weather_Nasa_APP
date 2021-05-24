import 'package:flutter/material.dart';
import 'package:myappcomplete/logicModel/logic.dart';
import 'package:myappcomplete/logicModel/logicdataStore.dart';

Nasadata nasadatavalue = Nasadata();

Getnasa requestdatevalue = Getnasa();

String year = "", month = "", day = "";
bool visibility = false;

class screen6 extends StatefulWidget {
  screen6({Key key}) : super(key: key);

  @override
  _screen6State createState() => _screen6State();
}

class _screen6State extends State<screen6> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightGreen,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text("NASA IMAGES"),
          ),
          body: Container(
            child: Column(
              children: [
                Text("Select date here"),
                Text(
                  "Select Date for which you want image of Please select date Before  ${todayDateTime.datetime}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Year"),
                  onChanged: (value) {
                    year = value;
                    requestdatevalue.year = int.parse(value);
                  },
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Month"),
                  onChanged: (value) {
                    month = value;
                    requestdatevalue.month = int.parse(value);
                  },
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Day"),
                  onChanged: (value) {
                    day = value;
                    requestdatevalue.day = int.parse(value);
                    setState(() {});
                  },
                ),
                ElevatedButton(
                  child: Text("Show Image"),
                  onPressed: () async {
                    if (year == "" && month == "" && day == "") {
                      visibility = true;
                      setState(() {});
                    } else {
                      await asyncfunction();
                      Navigator.pushNamed(context, "nasadataDisplay");
                    }
                  },
                ),
                SizedBox(height: 60),
                (visibility == true)
                    ? Text(
                        "Please do not leave year,month or day Field with null value")
                    : Text(""),
              ],
            ),
          )),
    );
  }
}

class screen9 extends StatefulWidget {
  screen9({Key key}) : super(key: key);

  @override
  _screen9State createState() => _screen9State();
}

class _screen9State extends State<screen9> {
  List<Widget> image1 = List<Widget>.generate(10, (index) => CardImage(index));
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: image1,
      ),
    );
  }
}

Widget CardImage(index) {
  return Card(
    color: Colors.white,
    child: Column(
      children: [
        Image.network("${nasadatavalue.imagelist[index]['img_src']}"),
        Text(
            "Taken by rover:${nasadatavalue.imagelist[index]['camera']['name']}"),
      ],
    ),
  );
}

void asyncfunction() async {
  print(requestdatevalue.year);
  print(requestdatevalue.month);
  print(requestdatevalue.day);

  requestdatevalue.getdata();
}
