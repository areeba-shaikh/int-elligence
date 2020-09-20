import 'package:ambulance/screens/login.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'database-manager.dart';

import 'User.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class Item {
  const Item(this.name);
  final String name;
}

class _RegisterPageState extends State<RegisterPage> {
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
        title: Text("Register Here"),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/register.png',
                height: 100,
                width: 100,
              ),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Register Here", style: TextStyle(fontSize: 21))),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: nameController,
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: passController,
                autocorrect: true,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: conpassController,
                autocorrect: true,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: ageController,
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'Age',
                  border: OutlineInputBorder(),
                  labelText: 'Age',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.0,
                          style: BorderStyle.solid,
                          color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                  ),
                  width: 400.0,
                  height: 60,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<Item>(
                      isExpanded: true,
                      hint: Text("   Gender"),
                      value: selectedgender,
                      // ignore: non_constant_identifier_names
                      onChanged: (Item Value) {
                        setState(() {
                          selectedgender = Value;
                        });
                      },
                      items: genders.map((Item gender) {
                        return DropdownMenuItem<Item>(
                          value: gender,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                gender.name,
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.0,
                          style: BorderStyle.solid,
                          color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                  ),
                  width: 400.0,
                  height: 60,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<Item>(
                      isExpanded: true,
                      hint: Text("   Blood Group"),
                      value: selectedblood,
                      // ignore: non_constant_identifier_names
                      onChanged: (Item Value) {
                        setState(() {
                          selectedblood = Value;
                        });
                      },
                      items: bloods.map((Item bloodgp) {
                        return DropdownMenuItem<Item>(
                          value: bloodgp,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                bloodgp.name,
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: mobileController,
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'Mobile',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                onPressed: () {
                  if (passController.text == conpassController.text) {
                    Future<dynamic> registerFuture = DBManager.db.registerUser(new User(nameController.text,
                        emailController.text, passController.text,
                        genderController.text,bloodController.text,
                        mobileController.text,ageController.text
                    ));
                    registerFuture.then((data) => {
                      //TODO: Show success message snackbar
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => Login(),
                      ))
                    }).catchError((err) => {
                      //TODO: Show failure message snackbar
                    });
                  } else {
                    showAlertDialog(context);
                  }
                  nameController.text = "";
                  passController.text = "";
                  conpassController.text = "";
                  emailController.text = "";
                  mobileController.text = "";
                  bloodController.text = "";
                  ageController.text = "";
                  genderController.text = "";
                },
                color: Colors.blue,
                textColor: Colors.white,
                //padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                child: Text("Register"),
              ),
            ],
          )),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error!!"),
    content: Text("Passwords Doesn't Match"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
