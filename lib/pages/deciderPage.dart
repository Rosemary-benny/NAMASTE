import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:namaste/pages/home.dart';
import 'package:namaste/pages/loginScreen.dart';
import 'package:namaste/pages/start_page.dart';
import 'package:namaste/providers/user_provider.dart';
import 'package:provider/provider.dart';

class DeciderPage extends StatefulWidget {
  static const routeName = '/decider';
  @override
  _DeciderPageState createState() => _DeciderPageState();
}

class _DeciderPageState extends State<DeciderPage> {
  String? uid = FirebaseAuth.instance.currentUser?.uid.toString();
  //bool loading = false;


//   Future getUser() async {
//     try {
//       setState(() {
//         loading = true;
//       });
  
 
//       response = await Provider.of<UserProvider>(context, listen: false)
//           .getUser(uid: FirebaseAuth.instance.currentUser!.uid);
// print("--------------------------------------------");
//           print(response);

//       setState(() {
//         loading = false;
//       });
//     } catch (e) {
//       setState(() {
//         loading = false;
//       });
//       print(e);
     
//     }
//   }

  @override
  Widget build(BuildContext context) {
    if(uid==null){
      return LoginScreen();
    }
   
    
     else {
    
        return StartPage();
     }
  
}
}