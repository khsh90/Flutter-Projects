import 'package:flutter/material.dart';

import '../widgets/signinwidget.dart';

class SigninPage extends StatelessWidget {
  static String route = '/signinPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SigninWidget(),
    ));
  }
}
