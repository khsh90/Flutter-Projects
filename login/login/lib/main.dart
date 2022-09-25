import 'package:flutter/material.dart';
import 'package:login/pages/edituserpage.dart';
import 'package:login/pages/loginsucuessuserpage.dart';
import 'package:login/pages/signin.dart';
import 'package:login/pages/signup.dart';
import 'package:login/pages/userdetailspage.dart';
import 'package:login/pages/userpage.dart';
import 'package:login/pages/weclome.dart';
import 'package:login/provider/usercredintial.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as p;

import 'model/objectbox.dart';
import 'objectbox.g.dart';

late Store store;

void main() {
  // This is required so ObjectBox can get the application directory
  // to store the database in.
  WidgetsFlutterBinding.ensureInitialized();

  getApplicationDocumentsDirectory().then((dir) => store =
      Store(getObjectBoxModel(), directory: p.join(dir.path, 'objectbox')));

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
          SigninPage.route: (context) => SigninPage(store),
          SignUPPage.route: (context) => SignUPPage(store),
          UserMAnagementPage.route: (context) => UserMAnagementPage(store),
          EditUserPage.route: (context) => EditUserPage(store),
          LoginSucessUserPage.route: (context) => const LoginSucessUserPage(),
          UserDetailsPage.route: (context) => UserDetailsPage(),
        },
      ),
    );
  }
}
