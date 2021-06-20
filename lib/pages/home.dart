import 'package:flutter/material.dart';
import 'package:namaste/pages/aboutUs.dart';
import 'package:namaste/pages/buyUs.dart';
import 'package:namaste/pages/paymentMode.dart';
import 'package:namaste/pages/productsScreen.dart';
import 'package:namaste/pages/splashScreen.dart';

import '../navbar.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
                icon: const Icon(Icons.menu, color: Colors.grey),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                });
          }),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        drawer: NavBar(),
        body: Center(
            child: FlatButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Products())),
                child: Text("Hey"))));
  }
}
