import 'package:flutter/foundation.dart';

class Coronadata {
  static final Coronadata _coronadata = Coronadata.internal();
  Coronadata.internal();
  factory Coronadata() {
    return _coronadata;
  }

  dynamic infectedPeople;
  dynamic deathPeople;
  dynamic totalCase;
  dynamic totalRecovered;
  dynamic underTreat;
  dynamic newDeath;
  dynamic activeCases;
}

class Nepsedata {
  List<dynamic> storedNepse;
  static final Nepsedata _nepsevalues = Nepsedata.internal();
  Nepsedata.internal();
  factory Nepsedata() {
    return _nepsevalues;
  }
  //everthing under 1units
}

class Rashidata {
  static final Rashidata _rashidata = Rashidata.internal();
  Rashidata.internal();
  factory Rashidata() {
    return _rashidata;
  }
  dynamic compatibility;
  dynamic description;
  dynamic luckyColor;
  dynamic luckynumber;
  dynamic luckytime;
  dynamic mood;
}

class Nasadata {
  static final Nasadata nasadata1 = Nasadata.internal();
  Nasadata.internal();
  factory Nasadata() {
    return nasadata1;
  }
  dynamic imagelist;
}

class Weatherdat {
  static final Weatherdat newWeather = Weatherdat.internal();
  Weatherdat.internal();
  factory Weatherdat() {
    return newWeather;
  }
  dynamic main; //cloud description
  dynamic temp;
  dynamic humidity;
  dynamic date;
  dynamic winspeed;
  dynamic pressure;
  dynamic cityname;
}

class DateTime {
  dynamic datetime;
  static final DateTime _date = DateTime.internal();
  DateTime.internal();
  factory DateTime() {
    return _date;
  }
}

class Vegetable {
  static final Vegetable _vegetable = Vegetable.internal();
  Vegetable.internal();
  factory Vegetable() {
    return _vegetable;
  }
  List values;
}
