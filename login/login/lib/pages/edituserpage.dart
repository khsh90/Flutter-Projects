import 'package:flutter/material.dart';
import 'package:login/widgets/usereditwidget.dart';

class EditUserPage extends StatelessWidget {
  static String route = '/editUserpage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit user page'),
      ),
      body: UserEditWidget(),
    );
  }
}
