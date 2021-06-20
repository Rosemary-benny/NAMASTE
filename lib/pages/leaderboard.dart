import 'package:flutter/material.dart';
import 'package:namaste/widgets/ranklist_item.dart';

import '../navbar.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 45,
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 35,
                    width: MediaQuery.of(context).size.width * 0.26,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("All Time"),
                  ),
                  Container(
                    height: 35,
                    width: MediaQuery.of(context).size.width * 0.3,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("This Week"),
                  ),
                  Container(
                    height: 35,
                    width: MediaQuery.of(context).size.width * 0.3,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("This Month"),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height * 0.25,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                      radius: 55,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                      radius: 55,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                      radius: 75,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 18,
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 16,
                          child: Text(
                            "2",
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 20,
                      child: CircleAvatar(
                          backgroundColor: Colors.yellow,
                          radius: 18,
                          child: Text(
                            "1",
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 18,
                      child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 16,
                          child: Text(
                            "3",
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                  ),
                  Positioned(
                    child: Text("James_202",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    top: 130,
                    left: 7,
                  ),
                  Positioned(
                      child: Text("James_202",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      top: 130,
                      right: 7),
                  Positioned(
                    bottom: 0,
                    left: 140,
                    child: Text("James_202",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Color(0xdd82D382),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(190, 190, 190, 0.7),
                      offset: Offset(1, -4),
                      blurRadius: 6.0,
                    ),
                  ]),
              child: Column(
                children: [
                  RankListItem(
                      avatar: 'assets/images/avatar.png',
                      uname: "Wanda Maximoff",
                      uid: '327786'),
                  RankListItem(
                      avatar: 'assets/images/avatar.png',
                      uname: "Tony Stark",
                      uid: '327786'),
                  RankListItem(
                      avatar: 'assets/images/avatar.png',
                      uname: "Steve Rogers",
                      uid: '327786'),
                  RankListItem(
                      avatar: 'assets/images/avatar.png',
                      uname: "Bruce Banner",
                      uid: '327786'),
                  RankListItem(
                      avatar: 'assets/images/avatar.png',
                      uname: "Natasha Romanoff",
                      uid: '327786'),
                  RankListItem(
                      avatar: 'assets/images/avatar.png',
                      uname: "Steve Rogers",
                      uid: '327786'),
                  RankListItem(
                      avatar: 'assets/images/avatar.png',
                      uname: "Bruce Banner",
                      uid: '327786'),
                  RankListItem(
                      avatar: 'assets/images/avatar.png',
                      uname: "Natasha Romanoff",
                      uid: '327786'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
