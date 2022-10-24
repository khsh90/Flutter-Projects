import 'package:flutter/material.dart';
import 'package:login/provider/authstate.dart';
import 'package:login/widgets/userprofilewidget.dart';
import 'package:provider/provider.dart';

class UserProfilePage extends StatelessWidget {
  static String route = '/userProfilePage';
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User profile'),
      ),
      body: UserProfileWidget(),
    );
  }
}
