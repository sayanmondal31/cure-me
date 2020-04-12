import 'package:flutter/material.dart';

class Symptoms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String updatedDatalist;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Symptoms",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue),
            ),
            Expanded(
              child: Container(
                child: ListView(
                  children: <Widget>[
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image(
                        height: 150,width: 150,
                        image: AssetImage('images/cough.gif'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                        child: Text(
                      'cough',
                      style: TextStyle(color: Colors.grey, fontSize: 25.0),
                    )),
                    
                     
                      SizedBox(height:5),
                       Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image(
                        height: 150,
                        image: AssetImage('images/fever.gif'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                        child: Text(
                      'Fever',
                      style: TextStyle(color: Colors.grey, fontSize: 25.0),
                    )),
                    SizedBox(height:5),
                       Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image(
                        height: 150,
                        image: AssetImage('images/tired.gif'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                        child: Text(
                      'Tired',
                      style: TextStyle(color: Colors.grey, fontSize: 25.0),
                    )),
                     SizedBox(height:5),
                       Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image(
                        height: 150,
                        image: AssetImage('images/breath.gif'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                        child: Text(
                      'Difficulty breathing (severe cases)',
                      style: TextStyle(color: Colors.grey, fontSize: 25.0),
                    )),
                    SizedBox(height:30)
                  ],
                ),
                // color: Colors.indigo,
              ),
            )
          ],
        ),
      ),
    );
  }
}
