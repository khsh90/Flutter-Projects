import 'package:flutter/material.dart';
import 'package:login/pages/signup.dart';

class UserMAnagementPage extends StatefulWidget {
  static String route = '/userManagment';

  @override
  State<UserMAnagementPage> createState() => _UserMAnagementPageState();
}

class _UserMAnagementPageState extends State<UserMAnagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Managment'), actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SignUPPage.route);
            },
            icon: Icon(Icons.add))
      ]),
      body: Center(),
      //  ListView.builder(
      //     itemCount: userData.length,
      //     itemBuilder: ((context, eachUserCredintial) => UserManagmentWidget(
      //         id: userData[eachUserCredintial].id,
      //         firstName: userData[eachUserCredintial].firstName,
      //         lastName: userData[eachUserCredintial].lastName,
      //         mobilePhone: userData[eachUserCredintial].mobilePhone,
      //         password: userData[eachUserCredintial].password,
      //         store: widget.store))),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(SignUPPage.route);
        },
        elevation: 6,
        child: const Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
