import 'package:covid19/model/contact.dart';
import 'package:covid19/services/information.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpAndContact extends StatefulWidget {
  final contact;
  HelpAndContact(this.contact);

  @override
  _HelpAndContactState createState() => _HelpAndContactState();
}

class _HelpAndContactState extends State<HelpAndContact> {
  var contact;
  var region;
  var contactNumber;
  List<Contact> list_of_contact = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateContactUi(widget.contact);
  }

  //adding all elements
  void addContact(String region,String contactNumber){
    final contactitem = Contact(location: region,number: contactNumber);
    list_of_contact.add(contactitem);
  }

  void updateContactUi(dynamic jsonContact) {
    for (int i = 0; i <= 36; i++) {
      region = jsonContact['data']['contacts']['regional'][i]['loc'];
      contactNumber = jsonContact['data']['contacts']['regional'][i]['number'];
      addContact(region, contactNumber);
    }

    print(contactNumber);
  }
   _launchCaller(String number) async {
    String url = "tel:$number";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    print("build called");
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Center(child: Text("Help and Contact"))),
      body: ListView.builder(
        itemCount: 36,
        itemBuilder: (context, index) {
          final myContacts = list_of_contact[index];
          return Card(
                      child: ListTile(
              leading: Text(myContacts.location) ,
              title: Text(myContacts.number,textAlign: TextAlign.center,),
              trailing: GestureDetector(
                onTap:(){
                  _launchCaller(myContacts.number);
                },
                child: CircleAvatar(
                  foregroundColor: Colors.blueGrey,
                  child: Icon(Icons.call))),

            ),
          );
        },
      ),
    );
  }
}



