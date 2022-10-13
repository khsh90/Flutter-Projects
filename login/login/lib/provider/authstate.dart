import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as s;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/core/res/applicationcons.dart';
//import 'package:login/objectbox.g.dart';

class AuthStateProvider with ChangeNotifier {
  bool isLoggedIn = false;

  bool get isLoggedin => isLoggedIn;
  // static Future<void> pop({bool? animated}) async {
  //   await SystemChannels.platform
  //       .invokeMethod<void>('SystemNavigator.pop', animated);
  // }

  AuthStateProvider() {
    getUserSession();
  }

  // Future<void> _init() async {
  //   // ApplicationConst.client
  //   //     .setEndpoint(ApplicationConst.apiEndpoint) // Your Appwrite Endpoint
  //   //     .setProject(ApplicationConst.projectId) // Your project ID
  //   //     .setSelfSigned(status: false);

  //   //ApplicationConst.account = Account(ApplicationConst.client);

  //   //await getUserSession();

  //   notifyListeners();
  // }

  Future<void> getUserSession() async {
    try {
      await ApplicationConst.account.getSession(sessionId: 'current');
      isLoggedIn = true;
    } on AppwriteException catch (error) {
      rethrow;
    } catch (e) {}
    notifyListeners();
  }

  Future<void> login({required String email, required String password}) async {
    try {
      await ApplicationConst.account
          .createEmailSession(email: email, password: password);
      // await getUserSession();
      // print(result.toMap());
      notifyListeners();
    } on AppwriteException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    await ApplicationConst.account.deleteSessions();

    notifyListeners();
  }

  Future<String> get getUserName async {
    final result = await ApplicationConst.account.get();

    return result.name;
  }

  Future<String> get getUserEmail async {
    final result = await ApplicationConst.account.get();

    return result.email;
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final result = await ApplicationConst.account.create(
          userId: ID.unique(), email: email, password: password, name: name);

      print('user created :${result.toMap()}');
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
