import 'package:covid19/screens/home.dart';
import 'package:covid19/screens/loadingScreen.dart';
import 'package:covid19/services/information.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: LoadingScreen(),
    );
  }
}
