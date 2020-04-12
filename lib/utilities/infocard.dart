import 'package:flutter/material.dart';

class MyInfoCard extends StatelessWidget {
  const MyInfoCard({Key key, this.button, this.text,this.icon}) : super(key: key);
  final Function button;
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: RaisedButton(
          highlightElevation: 20,
            onPressed: button,
            elevation: 20,
            color: Colors.brown[200],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Column(
                children: <Widget>[
                  Icon(icon),
                  SizedBox(height:10),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}