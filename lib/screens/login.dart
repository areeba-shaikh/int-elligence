import 'dart:async';

import 'package:ambulance/screens/home.dart';
import 'package:flutter/material.dart';

import 'package:ambulance/screens/register.dart';
import 'package:ambulance/screens/emergency.dart';
import 'database-manager.dart';
import 'User.dart';

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

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int _state = 0;

  Future<dynamic> senddata() async {
    DBManager.db.loginUser(
        new User.login(emailController.text, passwordController.text));
  }

  Future<bool> refresh() async {
    setState(() {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: RefreshIndicator(
          onRefresh: refresh,
          child: SingleChildScrollView(
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
                        child:
                            Text("User Login", style: TextStyle(fontSize: 21))),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: 280,
                        padding: EdgeInsets.all(10.0),
                        child: TextField(
                          controller: emailController,
                          autocorrect: true,
                          decoration: InputDecoration(
                              hintText: 'Enter Your Email Here'),
                        )),
                    Container(
                        width: 280,
                        padding: EdgeInsets.all(10.0),
                        child: TextField(
                          controller: passwordController,
                          autocorrect: true,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Enter Your Password Here'),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      child: setUpButtonChild(),
                      onPressed: () {
                        setState(() {
                          if (_state == 0) {
                            animateButton();
                          }
                        });
                        Future<dynamic> loginFuture = DBManager.db.loginUser(
                            new User.login(
                                emailController.text, passwordController.text));

                        loginFuture
                            .then((data) => {
                                  //TODO: Show success message snackbar
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage(),
                                      ))
                                })
                            .catchError((err) => {
                                  //TODO: Show failure message snackbar
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: new Text(
                                            "Login failed: Incorrect username or password"),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: new Text("OK"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          super.widget));
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                });
                      },
                      color: Colors.green,
                      textColor: Colors.white,
                      // padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                      // child: Text("Login"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )),
        ));
  }

  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "Login",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return Text("Login");
    }
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 2100), () {
      setState(() {
        _state = 2;
      });
    });
  }
}
