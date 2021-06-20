import 'package:flutter/material.dart';

import '../navbar.dart';

class PlasticWaste extends StatelessWidget {
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
            child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image(
                  image: AssetImage("assets/images/plastic.png"),
                ),
              ],
            ),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Column(children: [
                    SizedBox(height: 50),
                    Text("1000s of years!",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.green[900],
                            fontWeight: FontWeight.bold)),
                    Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                            "Yes, that is the time it takes for all the plastic in our landfills to get decomposed. Every plastic bag takes around 10-20 years while plastic bottles take 450 year.",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                            textAlign: TextAlign.center))
                  ]),
                  SizedBox(height: 100),
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
                  SizedBox(height: 70),
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
                              onTap: () {})))
                ]))
          ],
        )));
  }
}
