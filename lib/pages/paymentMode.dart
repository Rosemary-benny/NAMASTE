import 'dart:ui';

import 'package:flutter/material.dart';

import '../navbar.dart';

class PaymentMode extends StatelessWidget {
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
        // backgroundColor: Colors.green[50],
        body: Center(
          child: Column(
            children: [
              Text("Choose your payment method",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center),
              Container(
                  margin: EdgeInsets.only(top: 70),
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green[100]),
                  alignment: Alignment.center,
                  child: InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, "/card_payment"),
                      child: Text("CREDIT CARD",
                          style: TextStyle(color: Colors.green[900])))),
              Container(
                  margin: EdgeInsets.only(top: 30),
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green[100]),
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () => null,
                    child: Text("NET BANKING",
                        style: TextStyle(color: Colors.green[900])),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 30),
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green[100]),
                  alignment: Alignment.center,
                  child: InkWell(
                      onTap: () => null,
                      child: Text("UPI",
                          style: TextStyle(color: Colors.green[900])))),
              SizedBox(
                height: 100,
              ),
              Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    '“THE GREATEST THREAT TO OUR PLANET IS THE BELIEF THAT SOMEONE ELSE WILL SAVE IT.”',
                    style: TextStyle(color: Colors.green[900], fontSize: 20),
                    textAlign: TextAlign.center,
                  ))
            ],
          ),
        ));
  }
}
