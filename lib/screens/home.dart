import 'package:covid19/screens/contactNumber.dart';
import 'package:covid19/screens/help_and_contact.dart';
import 'package:covid19/screens/hospitals.dart';
import 'package:covid19/screens/loadingScreen.dart';
import 'package:covid19/services/information.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage(this.coviddata);
  final coviddata;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Information information = Information();
  var total;
  var recovered;
  var death;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUi(widget.coviddata);
  }

  void updateUi(dynamic datacovid) {
    total = datacovid['data']['summary']['total'];
    recovered = datacovid['data']['summary']['discharged'];
    death = datacovid['data']['summary']['deaths'];
  }

  void getHlpAndContact() async {
    Information information = Information();

    var contact = await information.covidContactInfo();

    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return HelpAndContact(contact);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(heroTag: 'tag1', onPressed: null),
          FloatingActionButton(
            heroTag: 'tag2',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactnumberPage()));
            },
            child: Icon(Icons.call),
          ),
        ],
      ),
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        elevation: 0,
        leading: GestureDetector(
            onTap: () async {
              var datacovid = await information.covidInfo();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoadingScreen()));
              updateUi(datacovid);
            },
            child: Icon(
              Icons.settings_input_antenna,
              color: Colors.lightGreenAccent,
            )),
        title: Center(child: Text("Cure Me")),
      ),
      body: Container(
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            // color: Colors.green,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Updatedcard(
                      data: total.toString(),
                      title: 'Infected',
                      color: Colors.indigo,
                    ),
                    Updatedcard(
                      data: recovered.toString(),
                      title: 'Recoverd',
                      color: Colors.green[800],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Updatedcard(
                      data: death.toString(),
                      title: 'Death',
                      color: Colors.orange[800],
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MyInfoCard(
                              button: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Hospitals()));
                              },
                              text: 'Hospitals & beds',
                            ),
                            SizedBox(width: 20),
                            MyInfoCard(
                              button: () {
                                CircularProgressIndicator();
                                getHlpAndContact();
                              },
                              text: 'help & Contact',
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          indent: 30,
                          endIndent: 30,
                        ),
                        Row(
                          children: <Widget>[
                            MyInfoCard(
                              button: null,
                              text: 'Symptoms',
                            ),
                            SizedBox(width: 20),
                            MyInfoCard(
                              button: null,
                              text: 'Prevention',
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class MyInfoCard extends StatelessWidget {
  const MyInfoCard({Key key, this.button, this.text}) : super(key: key);
  final Function button;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: RaisedButton(
            onPressed: button,
            elevation: 20,
            color: Colors.indigo,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            )),
      ),
    );
  }
}

class Updatedcard extends StatelessWidget {
  const Updatedcard({Key key, @required this.data, this.color, this.title})
      : super(key: key);
  final String title;
  final String data;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        color: Colors.indigo[200],
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
