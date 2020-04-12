import 'package:covid19/model/hospitals_bed.dart';
import 'package:flutter/material.dart';

class Hospitals extends StatefulWidget {
  Hospitals({this.hospitalBed});
  final hospitalBed;
  @override
  _HospitalsState createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  String state;

  int totalHospitals;
  int totalBeds;


  List<HospitalAndBed> hospital_Bed_List = [];

  void addHospitalBed(String state, int totalHospitals, inttotalBeds) {
    final hospitalBedData = HospitalAndBed(
        state: state, totalHospitals: totalHospitals, totalBeds: totalBeds);
    hospital_Bed_List.add(hospitalBedData);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateHospialBedUI(widget.hospitalBed);
  }

  void updateHospialBedUI(var jsonInfoHospital) {
    for (int i = 0; i <= 36; i++) {
      state = jsonInfoHospital['data']['regional'][i]['state'];

      totalHospitals = jsonInfoHospital['data']['regional'][i]['totalHospitals'];
      totalBeds = jsonInfoHospital['data']['regional'][i]['totalBeds'];
      addHospitalBed(state, totalHospitals, totalBeds);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Center(child: Text("Hospitals & Bed"))),
      body: ListView.builder(
        itemCount: 36,
        itemBuilder: (context, index) {
          final extractedhospitalAndBed = hospital_Bed_List[index];
          return Card(
            elevation: 10,
                      child: ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('State', style: TextStyle(
                    color: Colors.green
                  ),),
                  SizedBox(height:10),
                  Text(extractedhospitalAndBed.state),
                ],
              ),
              title: Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("Beds"),
                    SizedBox(height:10),
                    Text(extractedhospitalAndBed.totalBeds.toString()),
                  ],
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Hospitals"),
                  SizedBox(height:10),
                  Text(extractedhospitalAndBed.totalHospitals.toString()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


// import 'package:covid19/model/contact.dart';
// import 'package:covid19/services/information.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class HelpAndContact extends StatefulWidget {
//   final contact;
//   HelpAndContact(this.contact);

//   @override
//   _HelpAndContactState createState() => _HelpAndContactState();
// }

// class _HelpAndContactState extends State<HelpAndContact> {
//   var contact;
//   var region;
//   var contactNumber;
//   List<Contact> list_of_contact = [];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     updateContactUi(widget.contact);
//   }

//   //adding all elements
//   void addContact(String region,String contactNumber){
//     final contactitem = Contact(location: region,number: contactNumber);
//     list_of_contact.add(contactitem);
//   }

//   void updateContactUi(dynamic jsonContact) {
//     for (int i = 0; i <= 36; i++) {
//       region = jsonContact['data']['contacts']['regional'][i]['loc'];
//       contactNumber = jsonContact['data']['contacts']['regional'][i]['number'];
//       addContact(region, contactNumber);
//     }

//     print(contactNumber);
//   }
//    _launchCaller(String number) async {
//     String url = "tel:$number";
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     print("build called");
//     return Scaffold(
//       appBar: AppBar(title: Center(child: Text("Help and Contact"))),
//       body: ListView.builder(
//         itemCount: 36,
//         itemBuilder: (context, index) {
//           final myContacts = list_of_contact[index];
//           return Card(
//                       child: ListTile(
//               leading: Text(myContacts.location) ,
//               title: Text(myContacts.number,textAlign: TextAlign.center,),
//               trailing: GestureDetector(
//                 onTap:(){
//                   _launchCaller(myContacts.number);
//                 },
//                 child: CircleAvatar(
//                   foregroundColor: Colors.blueGrey,
//                   child: Icon(Icons.call))),

//             ),
//           );
//         },
//       ),
//     );
//   }
// }



