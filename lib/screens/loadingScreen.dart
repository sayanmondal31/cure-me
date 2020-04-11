import 'package:covid19/screens/home.dart';
import 'package:covid19/services/information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCovidData();

    print("got position");
  }

  void getCovidData() async {
    // WeatherModel weatherModel = WeatherModel();
    // var weatherData=await weatherModel.getLocationData();
    Information information = Information();

    var infoCovidData = await information.covidInfo();

    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) { return MyHomePage(infoCovidData);}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPumpingHeart(
          // duration: Duration(milliseconds: 100),
          color: Colors.green,
          size: 50.0,
        ),
      ),
    );
  }
}
