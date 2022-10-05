import 'package:flutter/material.dart';
import 'package:login/pages/edituserpage.dart';
import 'package:login/pages/loginsucuessuserpage.dart';
import 'package:login/pages/signin.dart';
import 'package:login/pages/signup.dart';
import 'package:login/pages/addEdituserpage.dart';
import 'package:login/pages/userjobsoverviewpage.dart';
import 'package:login/pages/userpage.dart';
import 'package:login/pages/weclome.dart';
import 'package:login/provider/authstate.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => AuthStateProvider()))
      ],
      child: MaterialApp(
        home: WelcomeApp(),
        routes: {
          SigninPage.route: (context) => SigninPage(),
          SignUPPage.route: (context) => SignUPPage(),
          UserMAnagementPage.route: (context) => UserMAnagementPage(),
          EditUserPage.route: (context) => EditUserPage(),
          LoginSucessUserPage.route: (context) => LoginSucessUserPage(),
          UserDetailsPage.route: (context) => UserDetailsPage(),
          UserjobsoverviewPage.route: (context) => UserjobsoverviewPage(),
        },
      ),
    );
  }
}
