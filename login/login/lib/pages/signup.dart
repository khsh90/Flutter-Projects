import 'package:flutter/material.dart';
import 'package:login/widgets/appDrawer.dart';
import 'package:login/widgets/signupwidget.dart';

import '../objectbox.g.dart';
import '../widgets/signinwidget.dart';

class SignUPPage extends StatelessWidget {
  static String route = '/signUpPage';
  final Store store;
  SignUPPage(this.store);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: SignupWidget(store),
      drawer: AppDrawer(),
    ));
  }
}
