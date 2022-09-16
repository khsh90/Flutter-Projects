import 'package:flutter/material.dart';
import 'package:login/provider/usercredintial.dart';

class UserManagmentWidget extends StatelessWidget {
  final String userName;
  final String password;

  UserManagmentWidget({required this.userName, required this.password});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          child: Card(
        child: ListTile(
          leading: Icon(Icons.person),
          title: Text(userName),
          subtitle: Text(password),
        ),
      )),
    );
  }
}
