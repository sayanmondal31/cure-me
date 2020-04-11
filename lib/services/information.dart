import 'package:covid19/services/networking.dart';
import 'package:flutter/material.dart';

class Information{

  Future<dynamic> covidInfo() async{
    var url = 'https://api.rootnet.in/covid19-in/stats/latest';
    NetworkHelper networkHelper = NetworkHelper(url);
    var covidData = await networkHelper.getData();
    return covidData;
  }

  Future<dynamic> covidContactInfo() async{
    var url2 = 'https://api.rootnet.in/covid19-in/contacts';
    NetworkHelper networkHelper = NetworkHelper(url2);
    var helpLineNumber = await networkHelper.getData();
    return helpLineNumber;
  }

}