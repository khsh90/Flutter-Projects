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
  String toString() => '($userName,$password)';
}

class UserCreditials with ChangeNotifier {
  final List<UserCredintial> _userCreditialsItems = [
    // UserCredintial(userName: 'kahled', password: '1234'),
    // UserCredintial(userName: 'dana', password: '123')
  ];
  List<UserCredintial> get usertCreditialsItems => [..._userCreditialsItems];

  void addUser({required UserCredintial userCred, required Store store}) {
    _userCreditialsItems.add(UserCredintial(
        userName: userCred.userName, password: userCred.password));
    store.box<UserCredintial>().put(userCred);
    notifyListeners();
  }

  void getUser({required store}) {
    store.box<UserCredintial>().getAll();
  }
}
