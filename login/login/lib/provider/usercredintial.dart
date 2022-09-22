import 'package:flutter/cupertino.dart';
import 'package:login/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

@Entity()
class UserCredintial with ChangeNotifier {
  int id;
  String userName;
  String password;
  String mtName = 'khaled';

  UserCredintial({
    this.id = 0,
    required this.userName,
    required this.password,
  });

  @override
  String toString() => '($id,$userName,$password)';
}

class UserCreditials with ChangeNotifier {
  final List<UserCredintial> _userCreditialsItems = [
    // UserCredintial(userName: 'kahled', password: '1234'),
    // UserCredintial(userName: 'dana', password: '123')
  ];

  List<UserCredintial> get usertCreditialsItems => [..._userCreditialsItems];
  List<UserCredintial> getuserCredintials(Store store) =>
      store.box<UserCredintial>().getAll();

  void addUser({required UserCredintial userCred, required Store store}) {
    // _userCreditialsItems.add(UserCredintial(
    //     userName: userCred.userName, password: userCred.password));

    List<UserCredintial> userData = store.box<UserCredintial>().getAll();

    store.box<UserCredintial>().put(userCred);
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
    print(store.box<UserCredintial>().getAll());

    notifyListeners();
  }

  void editOneUser(Store store, int id, UserCredintial userCred) {
    List<UserCredintial> userCredintialData =
        store.box<UserCredintial>().getAll();

    int userIdIndex =
        userCredintialData.indexWhere((eachUser) => eachUser.id == id);
    userCredintialData[userIdIndex];

    // userCredintialData[userIdIndex] = userCred;
    print(userIdIndex);
    //store.box<UserCredintial>().put(userCred);

    notifyListeners();
  }

  UserCredintial findUserById(Store store, int id) {
    List<UserCredintial> userCredintialData =
        store.box<UserCredintial>().getAll();

    UserCredintial selectedUser =
        userCredintialData.firstWhere((eachUser) => eachUser.id == id);

    return selectedUser;
  }
}
