import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:login/core/res/applicationcons.dart';
//import 'package:login/objectbox.g.dart';

class AuthStateProvider with ChangeNotifier {
  Client client = Client();
  late Account account;

  AuthStateProvider() {
    _init();
  }

  void _init() {
    client
        .setEndpoint(ApplicationConst.apiEndpoint) // Your Appwrite Endpoint
        .setProject(ApplicationConst.projectId) // Your project ID
        .setSelfSigned(status: true);

    account = Account(client);
    checkLogin();

    notifyListeners();
  }

  Future<void> checkLogin() async {
    final result = await account.get();
    print(result.toMap());
  }

  Future<void> login({required String email, required String password}) async {
    try {
      final result =
          await account.createEmailSession(email: email, password: password);

      print(result.toMap());
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final result = await account.create(
          userId: ID.unique(), email: email, password: password, name: name);

      print('user created :${result.toMap()}');
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
