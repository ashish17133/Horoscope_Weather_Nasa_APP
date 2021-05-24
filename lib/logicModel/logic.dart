import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:myappcomplete/logicModel/logicdataStore.dart';
import 'package:myappcomplete/splash.dart';

//creating intsance of vegetable class to store value
Vegetable kalimativeg = Vegetable();

//Instance of datetime class to store value form getdate()
DateTime todayDateTime = DateTime();
//Instance of weatherdata to store values and pass with class
Weatherdat weeatherouput = Weatherdat();
//Instance of nepse value stored....
Nepsedata nepsevalueStored = Nepsedata();
// rashi data to store rashi value
Rashidata rashivalue = Rashidata();
//Instance of coronadate store
Coronadata coronavalue = Coronadata();
//Nasa instance to store value obtain from nasa api
Nasadata nasadatavalue = Nasadata();

///

dynamic getdate() async {
  Uri url = Uri.parse("http://worldclockapi.com/api/json/utc/now");
  http.Response value = await http.get(url);
  dynamic valuee = json.decode(value.body);
  dynamic todaysdate = valuee['currentDateTime'].toString();
  dynamic datecache = todaysdate[0] +
      todaysdate[1] +
      todaysdate[2] +
      todaysdate[3] +
      todaysdate[4] +
      todaysdate[5] +
      todaysdate[6] +
      todaysdate[7] +
      todaysdate[8] +
      todaysdate[9];
  print(datecache);
  todayDateTime.datetime = datecache;

  return datecache;
}

class GetCoronadata {
  void getdata() async {
    Uri coronaurl =
        Uri.parse("https://covid-19-tracking.p.rapidapi.com/v1/nepal");
    var output = await http.get(coronaurl, headers: {
      "x-rapidapi-key": "0ed9b00cb0msh68f82cc04fbbaf3p175ee4jsn31afefca7e93"
    });
    dynamic coronadecoded = json.decode(output.body);
    coronavalue.totalCase = coronadecoded["Total Cases_text"];
    coronavalue.infectedPeople = coronadecoded["New Cases_text"];
    coronavalue.totalRecovered = coronadecoded["Total Recovered_text"];
    coronavalue.deathPeople = coronadecoded["Total Deaths_text"];
    coronavalue.newDeath = coronadecoded["New Deaths_text"];
    var myInt = coronavalue.totalCase;
    int totalcases1 = hashNumToint(coronavalue.totalCase);
    int totalrecover1 = hashNumToint(coronavalue.totalRecovered);
    int totaldeath1 = hashNumToint(coronavalue.deathPeople);
    int activecases = totalcases1 - totalrecover1 - totaldeath1;
    coronavalue.activeCases = activecases;
    //coronavalue.underTreat = coronavalue.totalCase - coronavalue.infectedPeople;
  }
}

class Getnepse {
  dynamic getdata() async {
    Uri nepseurl = Uri.parse(
        "https://www.nrb.org.np/api/forex/v1/rates?from=${todayDateTime.datetime}&to=${todayDateTime.datetime}&per_page=100&page=1");
    var output = await http.get(nepseurl);
    var valuenepse = json.decode(output.body);
    print(valuenepse['data']['payload'][0]['rates'][1]);
    nepsevalueStored.storedNepse = valuenepse['data']['payload'][0]['rates'];
    print(nepsevalueStored.storedNepse);
    return valuenepse;
  }
}

class Getrashi {
  String rashiName;
  Getrashi({this.rashiName});
  void getdata() async {
    Uri rashi = Uri.parse(
        "https://aztro.sameerkumar.website/?sign=$rashiName&day=today");
    var output = await http.post(rashi);
    dynamic decodedRashi = json.decode(output.body);
    rashivalue.compatibility = decodedRashi['compatibility'];
    rashivalue.luckyColor = decodedRashi['color'];
    rashivalue.luckynumber = decodedRashi['lucky_number'];
    rashivalue.description = decodedRashi['description'];
    rashivalue.luckytime = decodedRashi['lucky_time'];
    rashivalue.mood = decodedRashi['mood'];
    print(decodedRashi);
  }
}

class Getnasa {
  int year;
  int month;
  int day;
  Getnasa({this.day, this.month, this.year});
  void getdata() async {
    Uri nasa = Uri.parse(
        "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key=DEMO_KEY&earth_date=${year}-${month}-${day}");
    var nasaoutput = await http.get(nasa);
    dynamic nasadecoded = json.decode(nasaoutput.body);
    nasadatavalue.imagelist = nasadecoded['photos'];
    print(nasadatavalue.imagelist);
  }
}

class Getweather {
  String cityname = "Kathmandu";
  Getweather({this.cityname});
  Future<dynamic> getdata() async {
    Uri weather = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=${cityname}&appid=d80050c02fe33178ee0ba48cb2d0e424");
    http.Response weatheroutput = await http.get(weather);
    dynamic output = json.decode(weatheroutput.body);
    //creating weatherdat instance

    weeatherouput.humidity = output['main']['humidity'];
    weeatherouput.temp = (output['main']['temp'] - 273).ceil();
    weeatherouput.main = output['weather'][0]['main'];
    weeatherouput.winspeed = output['wind']['speed'];
    weeatherouput.pressure = output['main']['pressure'];
    weeatherouput.cityname = cityname;
    return output;
  }
}

var queryParameter = {"season": "2020"};
String queryString = Uri(queryParameters: queryParameter).query;

class Vegpriceapi {
  Future<dynamic> getdata() async {
    Uri goldpurl = Uri.parse(
        "http://realtime-api.opendatanepal.com/kalimati-price/api/today");
    dynamic outputdata = await http.get(goldpurl);
    dynamic decodevegprice = json.decode(outputdata.body);
    kalimativeg.values = decodevegprice['result'];
    print(kalimativeg.values[0]);
  }
}

//corona data has been received with , sign so we have to convert it to number
int hashNumToint(String hashNum) {
  int last = hashNum.length;
  String number = "";
  for (int i = 0; i <= last - 1; i++) {
    if (hashNum[i] == ",") {
      continue;
    }
    number = number + hashNum[i];
  }
  int number1 = int.parse(number);
  return number1;
}
