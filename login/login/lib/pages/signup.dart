import 'package:flutter/material.dart';
import 'package:login/widgets/signupwidget.dart';

class SignUPPage extends StatelessWidget {
  static String route = '/signUpPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SignupWidget(),
    ));
  }
}
