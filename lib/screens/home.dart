import 'package:covid19/screens/contactNumber.dart';
import 'package:covid19/screens/help_and_contact.dart';
import 'package:covid19/screens/hospitals.dart';
import 'package:covid19/screens/loadingScreen.dart';
import 'package:covid19/screens/map.dart';
import 'package:covid19/screens/prevention.dart';
import 'package:covid19/screens/symptoms.dart';
import 'package:covid19/services/information.dart';
import 'package:covid19/services/networking.dart';
import 'package:covid19/utilities/infocard.dart';
import 'package:covid19/utilities/updatedcard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    if(contact!=null){
      Center(child: CircularProgressIndicator());
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return HelpAndContact(contact);
    }));

    }
    
  }

  void gethospitalAndBed() async {
    Information information = Information();

    var hospitalandbedinfo = await information.covidHospitalsAnd();

  
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return Hospitals(
        hospitalBed: hospitalandbedinfo,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:  FloatingActionButton(
            
            heroTag: 'tag2',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MapPage()));
            },
            child: Icon(FontAwesomeIcons.map),
          ),
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown,
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
        title: Center(child: Text("Cure Me",style: TextStyle(
          fontSize:20
        ),)),
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
                            color: Colors.cyan,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  MyInfoCard(
                                    icon: FontAwesomeIcons.hospital,
                                    button: () {
                                      gethospitalAndBed();
                                    },
                                    text: 'Hospitals & beds',
                                  ),
                                  SizedBox(width: 20),
                                  MyInfoCard(
                                    icon: FontAwesomeIcons.handHoldingMedical,
                                    button: () {
                                      
                                      getHlpAndContact();
                                     
                                    },
                                    text: 'Help & Contact',
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
                                    icon: FontAwesomeIcons.viruses,
                                    button: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) => Symptoms());
                                    },
                                    text: 'Symptoms',
                                  ),
                                  SizedBox(width: 20),
                                  MyInfoCard(
                                    icon: FontAwesomeIcons.shieldVirus,
                                    button: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) => Prevention());
                                    },
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



