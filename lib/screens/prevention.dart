
import 'package:flutter/material.dart';



class Prevention extends StatelessWidget{


  
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
              "Prevention",
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
                        image: AssetImage('images/stayhome.gif'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                        child: Text(
                      'Stay Home',
                      style: TextStyle(color: Colors.grey, fontSize: 25.0),
                    )),
                    
                     
                      SizedBox(height:5),
                       Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image(
                        height: 150,
                        image: AssetImage('images/distance.gif'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                        child: Text(
                      'Keep distance',
                      style: TextStyle(color: Colors.grey, fontSize: 25.0),
                    )),
                    SizedBox(height:5),
                       Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image(
                        height: 150,
                        image: AssetImage('images/washhands.gif'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                        child: Text(
                      'Wash hands',
                      style: TextStyle(color: Colors.grey, fontSize: 25.0),
                    )),
                     SizedBox(height:5),
                       Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image(
                        height: 150,
                        image: AssetImage('images/coughprotection.gif'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                        child: Text(
                      'Cover your cough',
                      style: TextStyle(color: Colors.grey, fontSize: 25.0),
                    )),
                    SizedBox(height:30),
                      SizedBox(height:5),
                       Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image(
                        height: 150,
                        image: AssetImage('images/emergencycall.gif'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                        child: Text(
                      'Sick? call helpline number',
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
