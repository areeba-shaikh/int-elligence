import 'package:ambulance/screens/home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/icon.jpg',
                  height: 200,
                  width: 200,
                ),
                Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("User Login", style: TextStyle(fontSize: 21))),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 280,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: emailController,
                      autocorrect: true,
                      decoration:
                          InputDecoration(hintText: 'Enter Your Email Here'),
                    )),
                Container(
                    width: 280,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: passwordController,
                      autocorrect: true,
                      obscureText: true,
                      decoration:
                          InputDecoration(hintText: 'Enter Your Password Here'),
                    )),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  color: Colors.green,
                  textColor: Colors.white,
                  // padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                  child: Text("Login"),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
    );
  }
}
