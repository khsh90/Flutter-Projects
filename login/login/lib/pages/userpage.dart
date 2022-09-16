import 'package:flutter/material.dart';
import 'package:login/widgets/usermanamentwidget.dart';
import 'package:provider/provider.dart';

import '../provider/usercredintial.dart';

class UserMAnagementPage extends StatefulWidget {
  static String route = '/userManagment';
  UserMAnagementPage({Key? key}) : super(key: key);

  @override
  State<UserMAnagementPage> createState() => _UserMAnagementPageState();
}

class _UserMAnagementPageState extends State<UserMAnagementPage> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserCreditials>(context, listen: false)
        .usertCreditialsItems;

    return Scaffold(
        appBar: AppBar(title: Text('User Managment')),
        body: ListView.builder(
            itemCount: userData.length,
            itemBuilder: ((context, eachUserCredintial) => UserManagmentWidget(
                  userName: userData[eachUserCredintial].userName,
                  password: userData[eachUserCredintial].password,
                ))));
  }
}
