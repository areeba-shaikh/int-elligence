import 'package:flutter/material.dart';
import 'package:ambulance/screens/login.dart';
import 'package:ambulance/screens/register.dart';
import 'package:ambulance/screens/emergency.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Dial 108 App"),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/ICON.jpeg',
                  height: 300,
                  width: 300,
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ));
                    },
                    color: Colors.green,
                    textColor: Colors.white,
                    // padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                    child: Text("Login"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ));
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    //padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                    child: Text("Register"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Emergency(),
                          ));
                    },
                    color: Colors.red,
                    textColor: Colors.white,
                    //padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                    child: Text("Emergency"),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
