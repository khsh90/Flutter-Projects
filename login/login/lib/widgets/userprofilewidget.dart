import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/authstate.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final userAuthData = Provider.of<AuthStateProvider>(context, listen: false);

    return Container(
      margin: const EdgeInsets.all(15),
      child: Consumer<AuthStateProvider>(
        builder: (context, authStateData, child) => ListView(
          children: [
            FutureBuilder(
              initialData: 'Loading...',
              future: authStateData.getUserName,
              builder: (context, snapshot) => ListTile(
                leading: const Icon(Icons.person, color: Colors.blue),
                title: Text(snapshot.data as String),
              ),
            ),
            FutureBuilder(
              initialData: 'Loading...',
              future: authStateData.getUserEmail,
              builder: (context, snapshot) => ListTile(
                leading: const Icon(Icons.email, color: Colors.blue),
                title: Text(snapshot.data as String),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
