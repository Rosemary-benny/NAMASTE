import 'package:flutter/material.dart';
import 'package:namaste/pages/start_page.dart';
import 'home.dart';

class ScheduleConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        "SUCCESS",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      ),
      SizedBox(height: 20),
      Image(
        image: AssetImage("assets/images/pickup.png"),
      ),
      SizedBox(height: 20),
      // Text("Your next pickup is due on : "),
      // SizedBox(height: 10),
      // Container(
      //   alignment: Alignment.center,
      //   height: 50,
      //   width: MediaQuery.of(context).size.width / 1.1,
      //   decoration: BoxDecoration(
      //     color: Colors.green[100],
      //     borderRadius: BorderRadius.circular(10),
      //   ),
      //   child: Text("18 June, 2021 (Monday) - 5:00pm - 6:00pm",
      //       style: TextStyle(fontWeight: FontWeight.w800)),
      // ),
      SizedBox(height: 40),
      InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            "/home",
          );
        },
        child: Text("GO HOME >",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.green[900],
                fontSize: 18)),
      )
    ])));
  }
}
