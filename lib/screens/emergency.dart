import 'package:ambulance/screens/callambulance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text("Dial 108"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () => launch("tel://108"),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Emergency", style: TextStyle(fontSize: 21))),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: nameController,
              autocorrect: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: 'Name',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: Colors.white70),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: 1, color: Colors.green)),
                  fillColor: Colors.red[600],
                  filled: true,
                  icon: Icon(Icons.account_box)),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: phoneController,
              autocorrect: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: 'Mobile number',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: Colors.white70),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: 1, color: Colors.green)),
                  fillColor: Colors.red[600],
                  filled: true,
                  icon: Icon(Icons.phone_iphone)),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              width: double.infinity,
              height: 65,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Callambulance(),
                      ));

                  nameController.text = " ";
                  phoneController.text = " ";
                },

                color: Colors.red[600],
                textColor: Colors.white,
                //padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                child: Text("Emergency"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


