import 'package:flutter/material.dart';

class LoginSucessUserPage extends StatelessWidget {
  const LoginSucessUserPage({Key? key}) : super(key: key);
  static String route = '/loginSucessUserPage';

  @override
  Widget build(BuildContext context) {
    final userData =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    return Scaffold(
      appBar: AppBar(title: Text("Hello ${userData['userName']}")),
      body: Center(
        child: Text("Your Password is:${userData['password']}"),
      ),
    );
  }
}
