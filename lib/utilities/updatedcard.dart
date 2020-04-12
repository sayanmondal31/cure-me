import 'package:flutter/material.dart';

class Updatedcard extends StatelessWidget {
  const Updatedcard({Key key, @required this.data, this.color, this.title})
      : super(key: key);
  final String title;
  final String data;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 20, color: Colors.lime),
              ),
              SizedBox(height: 10),
              Text(
                data,
                style: TextStyle(fontSize: 30, color: color),
              ),
            ],
          ),
        ));
  }
}
