import 'package:flutter/material.dart';
import 'package:namaste/navbar.dart';

class EWaste extends StatelessWidget {
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
        body: Container(
            child: Column(
          children: [
            Image(
              image: AssetImage("assets/images/e.png"),
            ),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  SizedBox(height: 50),
                  Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[100]),
                      child: Align(
                          alignment: Alignment.center,
                          child: InkWell(
                              child: Text("SCHEDULE YOUR PICK UP",
                                  style: TextStyle(
                                      color: Colors.green[900],
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18)),
                              onTap: () => Navigator.pushNamed(
                                  context, "/waste_form")))),
                  SizedBox(height: 50),
                  Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[100]),
                      child: Align(
                          alignment: Alignment.center,
                          child: InkWell(
                              child: Text("Learn what we do with your waste",
                                  style: TextStyle(
                                      color: Colors.green[900],
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17)),
                              onTap: () {}))),
                  SizedBox(height: 30),
                  Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                          "Most electronics contain some form of toxic materials, including beryllium, cadmium, mercury, and lead, which pose serious environmental risks to our soil, water, air, and wildlife.",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          textAlign: TextAlign.center))
                ]))
          ],
        )));
  }
}
