import 'package:flutter/material.dart';
import 'package:namaste/pages/paymentMode.dart';

import '../navbar.dart';

class BuyUs extends StatelessWidget {
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
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("WE PLANT TREES",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center),
          SizedBox(
            height: 20,
          ),
          Text("TOGETHER WE PLANT FORESTS",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center),
          SizedBox(
            height: 50,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green[50],
              ),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              child: Text(
                  "The need for reforestation is global.\n\n This tree-planting project will establish a healthy tree canopy and pollutants captured by each tree will also improve health, providing oxygen and fresh air for the communities they surround.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center)),
          Container(
              margin: EdgeInsets.only(top: 30),
              width: 300,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green[900]),
              alignment: Alignment.center,
              child: InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentMode())),
                child: Text("BUY US A TREE",
                    style: TextStyle(color: Colors.white)),
              )),
        ],
      )),
    );
  }
}
