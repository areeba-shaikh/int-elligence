import 'package:flutter/material.dart';

class Callambulance extends StatefulWidget {
  @override
  _CallambulanceState createState() => _CallambulanceState();
}

class _CallambulanceState extends State<Callambulance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calling Ambulance"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.red[400]),
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Container(
              child: RaisedButton(
                onPressed: () {},
                color: Colors.red[600],
                textColor: Colors.white,
                child: Text("STOP"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
