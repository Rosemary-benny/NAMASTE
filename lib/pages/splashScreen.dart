import 'package:flutter/material.dart';
import 'package:namaste/pages/deciderPage.dart';
import 'dart:async';
import 'loginScreen.dart';

class SplashScreen extends StatefulWidget {
  //const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).popAndPushNamed(DeciderPage.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          new Image(
              image: new AssetImage("assets/images/logoNamaste.png"),
              width: 200),
          Text(
            "namaste",
            style: TextStyle(
                color: Colors.green[900],
                fontWeight: FontWeight.w700,
                fontSize: 30),
          )
        ])));
  }
}
