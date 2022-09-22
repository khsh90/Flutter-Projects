import 'package:flutter/material.dart';
import 'package:login/main.dart';
import 'package:login/widgets/usermanamentwidget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../objectbox.g.dart';
import '../provider/usercredintial.dart';
import 'package:path/path.dart' as p;

class UserMAnagementPage extends StatefulWidget {
  static String route = '/userManagment';

  final Store store;

  UserMAnagementPage(this.store);
  @override
  State<UserMAnagementPage> createState() => _UserMAnagementPageState();
}

class _UserMAnagementPageState extends State<UserMAnagementPage> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserCreditials>(
      context,
    ).getuserCredintials(widget.store);

    // late Store _store;
    // bool isInitized = false;
    // @override
    // void initState() {
    //   super.initState();

    //   getApplicationDocumentsDirectory().then((dir) => _store =
    //       Store(getObjectBoxModel(), directory: p.join(dir.path, 'objectbox')));

    //   // formFeildLoginButton();

    //   setState(() {
    //     isInitized = true;
    //   });
    // }

    // final userData = Provider.of<UserCreditials>(context, listen: false)
    //     .getuserCredintials(_store);

    return Scaffold(
        appBar: AppBar(title: const Text('User Managment')),
        body: ListView.builder(
            itemCount: userData.length,
            itemBuilder: ((context, eachUserCredintial) => UserManagmentWidget(
                id: userData[eachUserCredintial].id,
                userName: userData[eachUserCredintial].userName,
                password: userData[eachUserCredintial].password,
                store: widget.store))));
  }
}
