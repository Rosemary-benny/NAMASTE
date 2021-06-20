import 'package:flutter/material.dart';

import '../navbar.dart';

class Security extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Security"),
        backgroundColor: Color(0xff82D382),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      drawer: NavBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Icon(
                    Icons.lock,
                    size: 26,
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 6,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Icon(
                    Icons.shield,
                    size: 26,
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    "Two-Factor Authentication",
                    style: TextStyle(fontSize: 17),
                  ),
                  Divider(color: Colors.black),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 6,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Icon(
                    Icons.notifications,
                    size: 26,
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    "Notifications",
                    style: TextStyle(fontSize: 17),
                  ),
                  Divider(color: Colors.black),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 6,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Icon(
                    Icons.cloud,
                    size: 26,
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    "Backup Data",
                    style: TextStyle(fontSize: 17),
                  ),
                  Divider(color: Colors.black),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 6,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Icon(
                    Icons.delete,
                    size: 26,
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    "Delete Account",
                    style: TextStyle(fontSize: 17),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 6,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
          ],
        ),
      ),
    );
  }
}
