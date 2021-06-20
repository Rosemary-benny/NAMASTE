import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:namaste/models/user.dart';
import 'package:namaste/providers/user_provider.dart';
import 'package:namaste/utils/flushbar_service.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final _auth = FirebaseAuth.instance;

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  String repassw = "";
  String name = '';
  String phone = '';
  String pincode = '';
  bool _checkbox = false;
  bool _obscureLogin = true;
  bool _obscureSignup = true;
  bool _obscureConfirm = true;
  Utils utils = Utils();
  UserData userData = UserData();
  bool isLoading = false;
  @override
  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future getUser() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Navigator.pushReplacementNamed(
        context,
        "/home",
      );
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width,
                    child: Image(
                        image: AssetImage("assets/images/logoNamaste.png"),
                        width: 150),
                    decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        )),
                  ),
                  DefaultTabController(
                      length: 2, // length of tabs
                      initialIndex: 0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              child: TabBar(
                                labelColor: Colors.green,
                                unselectedLabelColor: Colors.black,
                                tabs: [
                                  Tab(text: 'Login'),
                                  Tab(text: 'Signup'),
                                ],
                              ),
                            ),
                            Container(
                                height: MediaQuery.of(context).size.height *
                                    5 /
                                    7, //height of TabBarView
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Colors.grey, width: 0.5))),
                                child: TabBarView(children: <Widget>[
                                  //Login tab code
                                  Container(
                                      child: Center(
                                    child: Column(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(top: 50),
                                            padding: EdgeInsets.only(
                                                left: 25, right: 25),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  labelText: 'Email',
                                                  labelStyle:
                                                      TextStyle(fontSize: 14)),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  email = newValue!;
                                                });
                                              },
                                            )),
                                        Container(
                                            padding: EdgeInsets.only(
                                                left: 25, right: 25),
                                            margin: EdgeInsets.only(top: 50),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText: 'Password',
                                                labelStyle:
                                                    TextStyle(fontSize: 14),
                                                suffixIcon: _obscureLogin
                                                    ? IconButton(
                                                        icon: Icon(Icons
                                                            .visibility_off),
                                                        onPressed: () {
                                                          setState(() {
                                                            _obscureLogin =
                                                                false;
                                                          });
                                                        })
                                                    : IconButton(
                                                        icon: Icon(
                                                            Icons.visibility),
                                                        onPressed: () {
                                                          setState(() {
                                                            _obscureLogin =
                                                                true;
                                                          });
                                                        }),
                                              ),
                                              obscureText: _obscureLogin,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  password = newValue!;
                                                });
                                              },
                                            )),
                                        SizedBox(height: 100),
                                        InkWell(
                                            onTap: () async {
                                              setState(() {
                                                isLoading = true;
                                              });
                                              try {
                                                final user = await _auth
                                                    .signInWithEmailAndPassword(
                                                        email: email,
                                                        password: password);
                                                print(
                                                    user.user!.uid.toString());
                                                if (user.user!.uid.isNotEmpty) {
                                                  setState(() {
                                                    isLoading = true;
                                                  });
                                                  Navigator
                                                      .pushReplacementNamed(
                                                    context,
                                                    "/home",
                                                  );
                                                }
                                              } catch (e) {
                                                utils.showBasicFlushBar(
                                                    content:
                                                        "Invalid Credentials");
                                                print(e);
                                              }
                                            },
                                            child: Container(
                                                width: 270,
                                                height: 50,
                                                child: Align(
                                                    alignment: Alignment(0, 0),
                                                    child: Text("Login")),
                                                decoration: BoxDecoration(
                                                    color: Colors.green[100],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))))
                                      ],
                                    ),
                                  )),

                                  //Signup tab code
                                  SingleChildScrollView(
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(top: 30),
                                              padding: EdgeInsets.only(
                                                  left: 25, right: 25),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                    labelText:
                                                        'Enter your name',
                                                    labelStyle: TextStyle(
                                                        fontSize: 14)),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    name = newValue!;
                                                  });
                                                },
                                              )),
                                          Container(
                                              margin: EdgeInsets.only(top: 30),
                                              padding: EdgeInsets.only(
                                                  left: 25, right: 25),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                    labelText:
                                                        'Enter your email',
                                                    labelStyle: TextStyle(
                                                        fontSize: 14)),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    email = newValue!;
                                                  });
                                                },
                                              )),
                                          Container(
                                              margin: EdgeInsets.only(top: 20),
                                              padding: EdgeInsets.only(
                                                  left: 25, right: 25),
                                              child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                      labelText:
                                                          'Enter your pincode',
                                                      labelStyle: TextStyle(
                                                          fontSize: 14)),
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      pincode = newValue!;
                                                    });
                                                  })),
                                          Container(
                                              margin: EdgeInsets.only(top: 20),
                                              padding: EdgeInsets.only(
                                                  left: 25, right: 25),
                                              child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'Enter your phone number',
                                                    labelStyle:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      phone = newValue!;
                                                    });
                                                  })),
                                          Container(
                                              padding: EdgeInsets.only(
                                                  left: 25, right: 25),
                                              margin: EdgeInsets.only(top: 20),
                                              child: TextFormField(
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'Enter new password',
                                                    labelStyle:
                                                        TextStyle(fontSize: 14),
                                                    suffixIcon: _obscureSignup
                                                        ? IconButton(
                                                            icon: Icon(Icons
                                                                .visibility_off),
                                                            onPressed: () {
                                                              setState(() {
                                                                _obscureSignup =
                                                                    false;
                                                              });
                                                            })
                                                        : IconButton(
                                                            icon: Icon(Icons
                                                                .visibility),
                                                            onPressed: () {
                                                              setState(() {
                                                                _obscureSignup =
                                                                    true;
                                                              });
                                                            }),
                                                  ),
                                                  obscureText: _obscureSignup,
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      password = newValue!;
                                                    });
                                                  })),
                                          Container(
                                              padding: EdgeInsets.only(
                                                  left: 25, right: 25),
                                              margin: EdgeInsets.only(top: 20),
                                              child: TextFormField(
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'Confirm new password',
                                                    labelStyle:
                                                        TextStyle(fontSize: 14),
                                                    suffixIcon: _obscureConfirm
                                                        ? IconButton(
                                                            icon: Icon(Icons
                                                                .visibility_off),
                                                            onPressed: () {
                                                              setState(() {
                                                                _obscureConfirm =
                                                                    false;
                                                              });
                                                            })
                                                        : IconButton(
                                                            icon: Icon(Icons
                                                                .visibility),
                                                            onPressed: () {
                                                              setState(() {
                                                                _obscureConfirm =
                                                                    true;
                                                              });
                                                            }),
                                                  ),
                                                  obscureText: _obscureConfirm,
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      repassw = newValue!;
                                                    });
                                                  })),
                                          SizedBox(height: 40),
                                          InkWell(
                                              onTap: () async {
                                                try {
                                                  if (password == repassw) {
                                                    if (password.length > 6) {
                                                      setState(() {
                                                        isLoading = true;
                                                      });
                                                      print(email);
                                                      print(password);
                                                      final newUser = await _auth
                                                          .createUserWithEmailAndPassword(
                                                              email: email,
                                                              password:
                                                                  password);
                                                      print(
                                                          "-------------------");
                                                      print(newUser.user!.uid
                                                          .toString());
                                                      if (newUser.user!.uid
                                                          .isNotEmpty) {
                                                        userData = UserData(
                                                            uid: newUser
                                                                .user!.uid
                                                                .toString(),
                                                            name: name,
                                                            phone: phone,
                                                            pincode: pincode,
                                                            email: email,
                                                            points: 0);

                                                        await Provider.of<
                                                                    UserProvider>(
                                                                context,
                                                                listen: false)
                                                            .addUser(
                                                                userData:
                                                                    userData);
                                                        setState(() {
                                                          isLoading = false;
                                                        });
                                                        Navigator
                                                            .pushReplacementNamed(
                                                          context,
                                                          "/home",
                                                        );
                                                      }
                                                    } else {
                                                      utils.showBasicFlushBar(
                                                          content:
                                                              "Password should be greater than 6 characters");
                                                    }
                                                  } else {
                                                    utils.showBasicFlushBar(
                                                        content:
                                                            "Password does not match");
                                                  }
                                                } catch (e) {
                                                  print(e);
                                                }
                                              },
                                              child: Container(
                                                  width: 270,
                                                  height: 50,
                                                  child: Align(
                                                      alignment:
                                                          Alignment(0, 0),
                                                      child:
                                                          Text("Get Started")),
                                                  decoration: BoxDecoration(
                                                      color: Colors.green[100],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))))
                                        ],
                                      ),
                                    ),
                                  ),
                                ]))
                          ])),
                ],
              )));
  }
}
