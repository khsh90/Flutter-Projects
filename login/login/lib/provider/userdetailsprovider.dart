import 'package:flutter/cupertino.dart';
import 'package:login/provider/usercredintial.dart';
import 'package:objectbox/objectbox.dart';

import '../model/entities.dart';

class UserDetailsPovider with ChangeNotifier {
  List<UserDetailPovider> getAll(Store store) =>
      store.box<UserDetailPovider>().getAll();

  UserDetailPovider findByID(Store store, int id) {
    var allUserDetailPovider = getAll(store);

    var userDetailsWithSpecificId = allUserDetailPovider
        .firstWhere((eacUserDetailPoviderh) => eacUserDetailPoviderh.id == id);

    return userDetailsWithSpecificId;
  }

  void addUserDetail(Store store, UserDetailPovider userDetail,) {



    store.box<UserDetailPovider>().put(userDetail);

    notifyListeners();
  }

  void deleteUSerJob(Store store, int id) {
    final userData = getAll(store);
    final userJobIndex =
        userData.indexWhere((eachUserIndex) => eachUserIndex.id == id);

    store.box<UserDetailPovider>().remove(userData[userJobIndex].id);
    notifyListeners();
  }
}
