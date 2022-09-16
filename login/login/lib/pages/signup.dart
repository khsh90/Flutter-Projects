import 'package:flutter/material.dart';
import 'package:login/widgets/appDrawer.dart';
import 'package:login/widgets/signupwidget.dart';

import '../widgets/signinwidget.dart';

class SignUPPage extends StatelessWidget {
  const SignUPPage({Key? key}) : super(key: key);

  static String route = '/signUpPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: SignupWidget(),
      drawer: AppDrawer(),
    ));
  }
}
