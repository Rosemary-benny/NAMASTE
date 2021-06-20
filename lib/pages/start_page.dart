import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:namaste/models/user.dart';
import 'package:namaste/providers/user_provider.dart';
import 'package:namaste/utils/flushbar_service.dart';
import 'package:namaste/widgets/card.dart';
import 'package:provider/provider.dart';

import '../navbar.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Utils utils = Utils();
  bool loading = false;
  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future getUser() async {
    try {
      setState(() {
        loading = true;
      });

      await Provider.of<UserProvider>(context, listen: false)
          .getUser(uid: FirebaseAuth.instance.currentUser!.uid);

      setState(() {
        loading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    UserData userData = Provider.of<UserProvider>(context).userData;
    return loading
        ? Scaffold(body: Center(child: CircularProgressIndicator()))
        : Container(
            color: Colors.white,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text("namaste ${userData.name}"),
                backgroundColor: Color(0xff82D382),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
              ),
              drawer: NavBar(),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 70,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black54,
                            ),
                            contentPadding:
                                EdgeInsets.only(top: 2, bottom: 2, left: 30),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Search",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.all(
                                const Radius.circular(30.0),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(30.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: GridView.count(
                          childAspectRatio: 0.83,
                          shrinkWrap: true,
                          primary: false,
                          crossAxisCount: 2,
                          mainAxisSpacing: 14,
                          crossAxisSpacing: 8,
                          children: <Widget>[
                            InkWell(
                              child: ContentCard(
                                  titleText: "Trash Collection",
                                  cardImage: "assets/images/trash-can.png"),
                              onTap: () {
                                Navigator.pushNamed(context, '/waste');
                              },
                            ),
                            InkWell(
                              child: ContentCard(
                                  titleText: "Sell",
                                  cardImage: "assets/images/trade.png"),
                              onTap: () {
                                Navigator.pushNamed(context, '/home_duplicate');
                              },
                            ),
                            InkWell(
                              child: ContentCard(
                                  titleText: "Buy",
                                  cardImage: "assets/images/shopping-bag.png"),
                              onTap: () {
                                Navigator.pushNamed(context, '/products');
                              },
                            ),
                            InkWell(
                              child: ContentCard(
                                  titleText: "Buy Us A Tree",
                                  cardImage: "assets/images/save-plants.png"),
                              onTap: () {
                                Navigator.pushNamed(context, '/buy_us');
                              },
                            ),
                            // InkWell(
                            //   child: ContentCard(
                            //       titleText: "Volunteer",
                            //       cardImage: "assets/images/charity.png"),
                            //   onTap: () {
                            //     Navigator.pushNamed(context, '/');
                            //   },
                            // ),
                            Provider.of<UserProvider>(context)
                                        .userData
                                        .isAdmin ==
                                    false
                                ? InkWell(
                                    onTap: () {
                                      utils.showAlert(
                                          errMsgL1:
                                              "Are you sure you want to register as Volunteer?",
                                          function: () async {
                                            String uid = FirebaseAuth
                                                .instance.currentUser!.uid
                                                .toString();

                                            Navigator.of(context).pop();
                                            await userProvider.makeAdmin(
                                                id: uid);
                                          });
                                    },
                                    child: ContentCard(
                                        titleText: "Volunteer",
                                        cardImage: "assets/images/charity.png"))
                                : InkWell(
                                    onTap: () {},
                                    child: ContentCard(
                                        titleText: "Volunteer Panel",
                                        cardImage:
                                            "assets/images/charity.png")),
                            InkWell(
                              child: ContentCard(
                                  titleText: "Future Initiatives",
                                  cardImage: "assets/images/creative.png"),
                              onTap: () {
                                Navigator.pushNamed(context, '/');
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
