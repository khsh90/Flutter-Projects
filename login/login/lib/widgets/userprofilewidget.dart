import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:login/core/res/applicationcons.dart';
import 'package:login/provider/completeprofileprovider.dart';
import 'package:provider/provider.dart';

class UserProfileWidget extends StatefulWidget {
  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  Map<String, dynamic> userdata = {};

  Future<Map<String, dynamic>> get accountInfo async {
    final result = await ApplicationConst.account.get();

    userdata = {'name': result.name, 'email': result.email};
    return userdata;
  }

  @override
  Future<void> didChangeDependencies() async {
    await Provider.of<CompleteProfileProvider>(context, listen: false)
        .getListOfDocument();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        child: FutureBuilder(
            initialData: 'Loading...',
            future: accountInfo,
            builder: (context, snapshot) => Consumer<CompleteProfileProvider>(
                    builder: (context, value, child) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView(children: [
                      ListTile(
                          leading: const Icon(Icons.email, color: Colors.blue),
                          title: Text('${userdata['name']}')),
                      ListTile(
                          leading: const Icon(Icons.email, color: Colors.blue),
                          title: Text('${userdata['email']}')),
                      ListTile(
                          leading: const Icon(Icons.email, color: Colors.blue),
                          title: Text('${value.completeprofileData[0].city}')),
                    ]);
                  }
                })));
  }
}
