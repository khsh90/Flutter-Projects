import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as s;
import 'package:appwrite/models.dart';
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

  Future<void> getUserSession() async {
    try {
      await ApplicationConst.account.getSession(sessionId: 'current');
      isLoggedIn = true;
    } on AppwriteException catch (error) {
      rethrow;
    } catch (e) {}
    notifyListeners();
  }

  Future<s.Session> getUserSessionIfAuthinticate() async {
    final userSession =
        await ApplicationConst.account.getSession(sessionId: 'current');
    print(userSession.toMap());
    return userSession;
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
