import 'package:flutter/material.dart';
import 'package:login/core/res/applicationcons.dart';
import 'package:login/pages/editprofession.dart';
import 'package:login/pages/signin.dart';
import 'package:login/pages/signup.dart';
import 'package:login/pages/splash_screen.dart';
import 'package:login/pages/userdetailspage.dart';
import 'package:login/pages/userProfilepage.dart';
import 'package:login/pages/userjobsoverviewpage.dart';
import 'package:login/pages/weclome.dart';
import 'package:login/provider/authstate.dart';
import 'package:login/provider/databasestateprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  ApplicationConst.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ((context) => AuthStateProvider())),
          ChangeNotifierProvider(create: ((context) => DatabaseStateProvider()))
        ],
        child: Consumer<AuthStateProvider>(
          builder: (context, value, _) => MaterialApp(
            home: FutureBuilder(
              future: value.getUserSessionIfAuthinticate(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SplashScreen();
                }
                if (snapshot.hasError) {
                  return WelcomeApp();
                } else {
                  return const UserjobsoverviewPage();
                }
              },
            ),
            routes: {
              SigninPage.route: (context) => SigninPage(),
              SignUPPage.route: (context) => SignUPPage(),
              UserDetailsPage.route: (context) => const UserDetailsPage(),
              UserjobsoverviewPage.route: (context) =>
                  const UserjobsoverviewPage(),
              UserProfilePage.route: ((context) => const UserProfilePage()),
              EditProfession.route: ((context) => const EditProfession())
            },
          ),
        ));
  }
}
