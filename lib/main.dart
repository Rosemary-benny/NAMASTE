import 'package:flutter/material.dart';
import 'package:namaste/pages/aboutUs.dart';
import 'package:namaste/pages/buyUs.dart';
import 'package:namaste/pages/deciderPage.dart';
import 'package:namaste/pages/eWaste.dart';
import 'package:namaste/pages/home.dart';
import 'package:namaste/pages/loginScreen.dart';
import 'package:namaste/pages/leaderboard.dart';
import 'package:namaste/pages/my_account.dart';
import 'package:namaste/pages/plasticWaste.dart';
import 'package:namaste/pages/productsScreen.dart';
import 'package:namaste/pages/security.dart';
import 'package:namaste/pages/start_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:namaste/pages/wasteForm.dart';
import 'package:namaste/providers/user_provider.dart';
import 'package:namaste/pages/wasteHome.dart';
import 'package:provider/provider.dart';
import 'pages/splashScreen.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: MaterialApp(
          title: 'Namaste',
          navigatorKey: navigatorKey,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(),
            '/login': (context) => LoginScreen(),
            '/home_duplicate': (context) => HomeScreen(),
            '/leader': (context) => LeaderBoard(),
            '/home': (context) => StartPage(),
            '/my_profile': (context) => MyProfile(),
            '/security': (context) => Security(),
            '/waste': (context) => WasteHome(),
            '/ewaste': (context) => EWaste(),
            '/plastic_waste': (context) => PlasticWaste(),
            '/waste_form': (context) => WasteForm(),
            '/products': (context) => Products(),
            '/buy_us': (context) => BuyUs(),
            '/about': (context) => AboutUs(),

            '/card_payment': (context) => BuyUs(),

            DeciderPage.routeName:(context)=>DeciderPage(),

          },
        ));
  }
}
