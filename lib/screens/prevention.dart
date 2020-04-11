
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
                    ListTile(
                      title:Text("data")
                    ),
                    ListTile(
                      title:Text("data")
                    ),
                    ListTile(
                      title:Text("data")
                    ),
                    ListTile(
                      title:Text("data")
                    ),
                    ListTile(
                      title:Text("data")
                    ),
                    ListTile(
                      title:Text("data")
                    ),
                    ListTile(
                      title:Text("data")
                    ),
                    ListTile(
                      title:Text("data")
                    ),ListTile(
                      title:Text("data")
                    ),ListTile(
                      title:Text("data")
                    ),
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
