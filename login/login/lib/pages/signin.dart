import 'package:flutter/material.dart';

import '../widgets/signinwidget.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  static String route = '/signinPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SigninWidget(),
    ));
  }
}
