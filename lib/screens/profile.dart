import 'package:flutter/material.dart';
import 'dart:async';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class Item {
  const Item(this.name);
  final String name;
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController conpassController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bloodController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  Item selectedblood;
  Item selectedgender;
  List<Item> bloods = <Item>[
    const Item('A +ve'),
    const Item('A -ve'),
    const Item('B +ve'),
    const Item('B -ve'),
    const Item('AB +ve'),
    const Item('AB -ve'),
    const Item('O +ve'),
    const Item('O -ve')
  ];
  List<Item> genders = <Item>[
    const Item("Male"),
    const Item("Female"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Icon(
                  Icons.account_circle,
                  size: 130,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Name",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                child: TextField(
                  controller: nameController,
                  autocorrect: true,
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Age",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                child: TextField(
                  controller: ageController,
                  autocorrect: true,
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Gender",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                child: TextField(
                  controller: genderController,
                  autocorrect: true,
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Blood Group",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                child: TextField(
                  controller: bloodController,
                  autocorrect: true,
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Mobile",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                child: TextField(
                  controller: mobileController,
                  autocorrect: true,
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  //padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                  child: Text("Ok"),
                ),
              ),
            ],
          )),
    );
  }
}
