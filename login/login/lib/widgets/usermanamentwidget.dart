import 'package:flutter/material.dart';
import 'package:login/pages/edituserpage.dart';
import 'package:login/provider/usercredintial.dart';
import 'package:provider/provider.dart';

import '../objectbox.g.dart';

class UserManagmentWidget extends StatelessWidget {
  final int id;
  final String firstName;
  final String lastName;
  final int mobilePhone;
  final String password;
  final Store store;

  UserManagmentWidget(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.mobilePhone,
      required this.password,
      required this.store});
  @override
  Widget build(BuildContext context) {
    return Container(
        // decoration: const BoxDecoration(
        //   color: Colors.green,
        // ),
        margin: const EdgeInsets.all(10),
        child: Card(
            elevation: 5,
            child: ListTile(
                leading: const Icon(Icons.person),
                title:
                    Text('Name :$firstName $lastName,Your userName:$mobilePhone'),
                subtitle: Text(password),
                trailing: SizedBox(
                  width: MediaQuery.of(context).size.width - 255,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(EditUserPage.route, arguments: id);
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                          )),
                      IconButton(
                          onPressed: () {
                            Provider.of<UserCreditials>(context, listen: false)
                                .removeOneUser(store, id);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ],
                  ),
                ))));
  }
}
