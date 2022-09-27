import 'package:flutter/material.dart';
import 'package:login/provider/usercredintial.dart';
import 'package:provider/provider.dart';

import '../objectbox.g.dart';

class LoginSucessUserPage extends StatelessWidget {
  static String route = '/loginSucessUserPage';
  final Store store;

  LoginSucessUserPage(this.store);
  @override
  Widget build(BuildContext context) {
    final userId = ModalRoute.of(context)?.settings.arguments as int;

    final userData = Provider.of<UserCreditials>(context, listen: true)
        .findUserById(store, userId);

    return Scaffold(
      appBar: AppBar(
          title: Text("Hello ${userData.firstName} ${userData.lastName} ")),
      body: Center(
        child: Text(
            "Your user name is ${userData.mobilePhone} and Password is:${userData.password},${userData.country},${userData.city},${userData.area} id is :$userId"),
      ),
    );
  }
}
