import 'package:flutter/material.dart';
import 'package:login/widgets/usereditwidget.dart';

import '../objectbox.g.dart';

class EditUserPage extends StatelessWidget {
  final Store store;

  static String route = '/editUserpage';
  EditUserPage(this.store);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit user page'),
      ),
      body: UserEditWidget(store),
    );
  }
}
