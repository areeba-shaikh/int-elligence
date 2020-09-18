import 'package:flutter/material.dart';
import 'package:ambulance/screens/initial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ambulance App',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
