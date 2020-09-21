import 'package:flutter/material.dart';
import 'dart:async';

import 'database-manager.dart';

import 'User.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class Item {
  const Item(this.name);
  final String name;
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  "Dial 108",
                  style: TextStyle(fontSize: 40),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/ICON.jpeg',
                  height: 250,
                  width: 250,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "App Developed By:",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Suryakant Kashyap",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Dhairya Deshmukh",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Areeba Shaikh",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Sudhanshoo Sarage",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
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
            ),
          )),
    );
  }
}
