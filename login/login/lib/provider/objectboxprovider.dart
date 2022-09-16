// import 'dart:async';

// import 'package:login/objectbox.g.dart';
// import 'package:login/provider/usercredintial.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;

// class ObjectBoxProvider {
//   late Store _store;
//   late Box<UserCredintials> usercred;

//   ObjectBoxProvider._create(this._store);

//   static Future<ObjectBoxProvider> create() async {
//     final dire = await getApplicationDocumentsDirectory();
//     final store = await openStore(directory: p.join(dire.path, 'objectbox'));
//     return ObjectBoxProvider._create(store);
//   }



// }
