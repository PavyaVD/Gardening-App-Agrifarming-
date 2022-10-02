import 'package:flutter/material.dart';
//import 'package:learnapp/login_screen.dart';
import 'Dashboard.dart';
import 'constants.dart';
//import 'login_screen.dart';

//sJ7M62PdAgYxSmEyTQ6n2QJg6sW2  //uid
void main() {
  runApp(InitialScreen());
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}
