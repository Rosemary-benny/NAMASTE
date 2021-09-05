import 'package:flutter/material.dart';
import '../navbar.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

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
            children: [
              SizedBox(height: 15),
              Text(
                "About Us",
                style: TextStyle(
                    color: Colors.green[900],
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Divider(
                thickness: 2,
                color: Colors.green[300],
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.all(15),
                child: Expanded(
                    child: Text(
                        " We use a sustainable farming system to grow, hatch and raise black soldier fly larvae for pets like reptiles, chickens and small animals.We market our larvae products under the brand name Namaste.\n\n"
                        "If you're someone who love to live healthy while reducing your impact on the environment, or you just want to find a good way of making your organic waste useful, you'll absolutely love this app.",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        textAlign: TextAlign.left)),
              ),
              SizedBox(height: 100),
              Text("namaste",
                  style: TextStyle(
                      color: Colors.green[900],
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center),
              Text("The nowaste app",
                  style: TextStyle(
                      color: Colors.green[900],
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center),
            ],
          ),
        ));
  }
}
