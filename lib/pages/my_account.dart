import 'package:flutter/material.dart';
import 'package:namaste/models/user.dart';
import 'package:namaste/providers/user_provider.dart';
import 'package:namaste/widgets/text_field.dart';
import 'package:provider/provider.dart';

import '../navbar.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  @override
  Widget build(BuildContext context) {
       UserData userData= Provider.of<UserProvider>(context, listen: false).userData;
      TextEditingController unameController =
      new TextEditingController(text: userData.name);
  TextEditingController emailController =
      new TextEditingController(text: userData.email);
  TextEditingController phoneController =
      new TextEditingController(text: userData.phone);
  TextEditingController locationController =
      new TextEditingController(text: userData.pincode);
      TextEditingController pointsController =
      new TextEditingController(text: userData.points.toString());
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
            Container(
                width: 180,
                height: 180,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      width: 180,
                      height: 180,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                    ),
                    // Positioned(
                    //   child: CircleAvatar(
                    //     backgroundColor: Colors.black,
                    //     radius: 18,
                    //     child: CircleAvatar(
                    //       backgroundColor: Colors.white,
                    //       radius: 16,
                    //       child: Icon(
                    //         Icons.edit,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //   ),
                    //   bottom: 10,
                    //   right: 10,
                    // ),
                  ],
                )),
            LabeledTextField(
              label: "Name",
              controller: unameController,
            ),
            Text(
              "Personal Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            LabeledTextField(
              label: "Email",
              controller: emailController,
            ),
            LabeledTextField(
              label: "Phone",
              controller: phoneController,
            ),
            LabeledTextField(
              label: "Location",
              controller: locationController,
            ),
           LabeledTextField(
 label: "Points",
              controller: pointsController,
           )
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     TextButton(
            //       style: ButtonStyle(
            //         backgroundColor:
            //             MaterialStateProperty.all<Color>(Colors.redAccent),
            //       ),
            //       onPressed: () {},
            //       child: Text(
            //         "Cancel",
            //         style: TextStyle(
            //           color: Colors.white,
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 50,
            //     ),
            //     TextButton(
            //       onPressed: () {},
            //       style: ButtonStyle(
            //         backgroundColor:
            //             MaterialStateProperty.all<Color>(Color(0xff81c784)),
            //       ),
            //       child: Text(
            //         "Submit",
            //         style: TextStyle(
            //           color: Colors.white,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
