import 'package:flutter/cupertino.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../model/entities.dart';


class UserCreditials with ChangeNotifier {
  // final List<UserCredintial> _userCreditialsItems = [
  //   // UserCredintial(userName: 'kahled', password: '1234'),
  //   // UserCredintial(userName: 'dana', password: '123')
  // ];

  //List<UserCredintial> get usertCreditialsItems => [..._userCreditialsItems];
  List<UserCredintial> getuserCredintials(Store store) =>
      store.box<UserCredintial>().getAll();

  void addUser({required UserCredintial userCred, required Store store}) {
    // _userCreditialsItems.add(UserCredintial(
    //     userName: userCred.userName, password: userCred.password));

    // List<UserCredintial> userData = store.box<UserCredintial>().getAll();
    try {
      store.box<UserCredintial>().put(userCred);
    } on UniqueViolationException catch (error) {
      rethrow;
    } catch (error) {}

    // store.close();
    notifyListeners();
  }

  void removeOneUser(
    Store store,
    int id,
  ) {
    List<UserCredintial> userCredintialData =
        store.box<UserCredintial>().getAll();

    int userIdIndex =
        userCredintialData.indexWhere((eachUser) => eachUser.id == id);
    // print(userIdIndex);
    store.box<UserCredintial>().remove(userCredintialData[userIdIndex].id);
    //print(store.box<UserCredintial>().getAll());
    //   store.close();

    notifyListeners();
  }

  void editOneUser(Store store, int id, UserCredintial userCred) {
    List<UserCredintial> userData = getuserCredintials(store);

    int userIdIndex = userData.indexWhere((eachUser) => eachUser.id == id);

    // print('useriddex $userIdIndex');
    // print('user id $id');
    // print('current user data : $userCred');

    userData[userIdIndex] = userCred;
    store.box<UserCredintial>().put(userCred);
    // store.close();

    notifyListeners();
  }

  UserCredintial findUserById(Store store, int id) {
    List<UserCredintial> userCredintialData =
        store.box<UserCredintial>().getAll();

    UserCredintial selectedUser =
        userCredintialData.firstWhere((eachUser) => eachUser.id == id);

    return selectedUser;
  }

  // void findByUserNameAndPassword(
  //     Store store, UserCredintial userParameter) {
  //   Query<UserCredintial> query = store
  //       .box<UserCredintial>()
  //       .query(UserCredintial_.userName
  //           .equals(userParameter.userName)
  //           .and(UserCredintial_.password.equals(userParameter.password)))
  //       .build();
  //   List<UserCredintial> userData = query.find();

  //   query.close();
  //   if (userData.isNotEmpty) {
  //     print('login success');
  //   } else {
  //     print('login Faild');
  //   }

  //   notifyListeners();
  // }
}
