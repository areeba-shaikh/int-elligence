import 'package:flutter/material.dart';
import 'package:ambulance/screens/initial.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dial 108',
        home: AnimatedSplashScreen(
          duration: 3000,
          splash: Image.asset(
            'assets/images/splash.jpeg',
          ),
          splashIconSize: 500,
          nextScreen: Home(),
          splashTransition: SplashTransition.fadeTransition,
          //pageTransitionType: PageTransitionType.scale,
          backgroundColor: Hexcolor('#043249'),
        ));
  }
}
