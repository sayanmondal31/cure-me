import 'package:flutter/material.dart';


class ContactnumberPage extends StatefulWidget {
  @override
  _ContactnumberPageState createState() => _ContactnumberPageState();
}

class _ContactnumberPageState extends State<ContactnumberPage> {

  String stateName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.green[200]
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.white,
                      ),
                      hintText: 'enter state name ',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none)),

                          onChanged: (value){
                            stateName = value;
                          },
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context,stateName);
                },
                child: Text(
                  'Get Weather',
                  // style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
