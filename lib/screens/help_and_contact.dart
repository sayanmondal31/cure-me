import 'package:covid19/model/contact.dart';
import 'package:covid19/services/information.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    print("build called");
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Help and Contact"))),
      body: ListView.builder(
        itemCount: 36,
        itemBuilder: (context, index) {
          final myContacts = list_of_contact[index];
          return Card(
                      child: ListTile(
              leading: Text(myContacts.location) ,
              title: Text(myContacts.number,textAlign: TextAlign.center,),
              trailing: Icon(Icons.call),

            ),
          );
        },
      ),
    );
  }
}



