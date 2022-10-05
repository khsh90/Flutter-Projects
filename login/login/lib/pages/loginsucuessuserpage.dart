import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginSucessUserPage extends StatelessWidget {
  static String route = '/loginSucessUserPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello user')),
      body: const Center(
        child: Text('Hello user'),
      ),
    );
  }
}
