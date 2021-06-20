import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:namaste/models/user.dart';
import 'package:namaste/providers/user_provider.dart';
import 'package:provider/provider.dart';

import 'pages/home.dart';

class NavBar extends StatelessWidget {
  //const NavBar({ Key? key }) : super(key: key);
  List navRoutes = [
    {"pagename": "Home", "icon": Icon(Icons.home_filled), "to": "/home"},
    {
      "pagename": "Trash Collection",
      "icon": Icon(Icons.shopping_cart_outlined),
      "to": "/waste"
    },
    {"pagename": "Buy", "icon": Icon(Icons.shopping_bag), "to": "/products"},
    {"pagename": "Sell", "icon": Icon(Icons.money), "to": HomeScreen()},
    {
      "pagename": "Buy Us a Tree",
      "icon": Icon(FontAwesomeIcons.tree),
      "to": "/buy_us"
    },
    {
      "pagename": "Volunteer",
      "icon": Icon(FontAwesomeIcons.donate),
      "to": "/home"
    },
    {
      "pagename": "Future Initiatives",
      "icon": Icon(FontAwesomeIcons.lightbulb),
      "to": HomeScreen()
    },
    {
      "pagename": "Notifications",
      "icon": Icon(FontAwesomeIcons.bell),
      "to": "/home"
    },
    {"pagename": "My Profile", "icon": Icon(Icons.person), "to": "/my_profile"},
    {"pagename": "About Us", "icon": Icon(Icons.star), "to": "/about"},
    {"pagename": "Settings", "icon": Icon(Icons.settings), "to": "/security"},
    {"pagename": "Help", "icon": Icon(Icons.help), "to": HomeScreen()},
    {"pagename": "Logout", "icon": Icon(Icons.logout), "to": "/login"},
  ];

  @override
  Widget build(BuildContext context) {
     UserData userData= Provider.of<UserProvider>(context, listen: false).userData;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Row(children: [
              // ClipOval(
              //   child: Image.network(
              //     'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
              //     fit: BoxFit.cover,
              //     width: 90,
              //     height: 90,
              //   ),
              // ),
                ClipOval(
                child: Icon(Icons.person,
                 size: 60,
                ),
              ),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                      

                            Text("${userData.name}",
                                style: TextStyle(fontSize: 22),
                                textAlign: TextAlign.left),
                            Text("Points: ${userData.points}", textAlign: TextAlign.left)

                          ]))),
            ]),
          ),
          SizedBox(
              height: 700,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: navRoutes.length,
                itemBuilder: (context, index) => Column(children: [
                  ListTile(
                      title: Text("${navRoutes[index]['pagename']}"),
                      leading: navRoutes[index]["icon"],
                      onTap: () {
                        Navigator.pushNamed(context, navRoutes[index]['to']);
                      }),
                  Divider()
                ]),
              ))
        ],
      ),
    );
  }
}
