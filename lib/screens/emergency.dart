import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Emergency extends StatefulWidget {
  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dial 108"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () => launch("tel://108"),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.redAccent),
        child: Column(
          children: <Widget>[
            Container(
              child: TextField(
                decoration:
                    InputDecoration(border: InputBorder.none, hintText: 'Name'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
