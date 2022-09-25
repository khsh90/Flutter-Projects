import 'package:flutter/material.dart';

import '../objectbox.g.dart';
import '../widgets/signinwidget.dart';

class SigninPage extends StatelessWidget {
  final Store store;

  SigninPage(this.store);
  static String route = '/signinPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SigninWidget(store),
    ));
  }
}
