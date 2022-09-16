import 'package:flutter/material.dart';
import 'package:login/pages/signin.dart';
import 'package:login/pages/signup.dart';
import 'package:login/pages/userpage.dart';
import 'package:login/pages/weclome.dart';
import 'package:login/provider/usercredintial.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserCreditials())
      ],
      child: MaterialApp(
        home: WelcomeApp(),
        routes: {
          SigninPage.route: (context) => const SigninPage(),
          SignUPPage.route: (context) => const SignUPPage(),
          UserMAnagementPage.route: (context) => UserMAnagementPage(),
        },
      ),
    );
  }
}
