import 'package:flutter/material.dart';
import 'package:namaste/navbar.dart';
import 'package:namaste/pages/eWaste.dart';
import 'package:namaste/pages/plasticWaste.dart';

class WasteHome extends StatefulWidget {
  const WasteHome({Key? key}) : super(key: key);

  @override
  _WasteHomeState createState() => _WasteHomeState();
}

class _WasteHomeState extends State<WasteHome> {
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("We don't want to live in a trash can",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () => null,
                  child: getImageCard(
                      context, "assets/images/bio-waste.png", "Bio-waste")),
              InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EWaste())),
                  child: getImageCard(
                      context, "assets/images/e-waste.png", "E-waste"))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PlasticWaste())),
                  child: getImageCard(
                      context, "assets/images/plas.png", "Plastic waste")),
              InkWell(
                  onTap: () => null,
                  child: getImageCard(
                      context, "assets/images/agri.png", "Agricultural waste"))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.1,
                      color: Colors.green[600],
                      child: Icon(Icons.camera_alt,
                          color: Colors.white, size: 34)))
            ],
          ),
          Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Text(
                "So let's work together to not make it one!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ))
        ],
      )),
    );
  }
}

Widget getImageCard(BuildContext context, String imgUrl, String name) {
  return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5.0,
          spreadRadius: 0.0,
        ), //BoxShadow
      ]),
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width / 2.2,
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.green[100],
          child: Column(children: [
            Image(
              image: new AssetImage("$imgUrl"),
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 2.2,
            ),
            Text("$name", style: TextStyle(color: Colors.green[900])),
          ])));
}
