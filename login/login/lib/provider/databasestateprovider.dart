import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:login/model/userProfessionmodel.dart';

import '../core/res/applicationcons.dart';

class DatabaseStateProvider with ChangeNotifier {
  DatabaseStateProvider() {
    // _init();
  }

  // void _init() {
  //   // ApplicationConst.client
  //   //     .setEndpoint(ApplicationConst.apiEndpoint) // Your Appwrite Endpoint
  //   //     .setProject(ApplicationConst.projectId); // Your project ID
  //  // ApplicationConst.databases = Databases(ApplicationConst.client);
  //   notifyListeners();
  // }

  List<UserProfessionModel> _userPofessionModel = [];

  List<UserProfessionModel> get userPofessionModel => [..._userPofessionModel];

  UserProfessionModel findById(String id) {
    return _userPofessionModel
        .firstWhere((eachItem) => eachItem.documentId == id);
  }

  Future<void> getListOfDocument() async {
    final result = await ApplicationConst.databases.listDocuments(
      databaseId: ApplicationConst.jobDatabaseId,
      collectionId: ApplicationConst.jobCollectionId,
    );
    final List<UserProfessionModel> loadedUserProfessions = [];

    var extractedData = result.documents.map((e) => e.data).toList();

    for (var eachUserProfession in extractedData) {
      //  print(eachUserProfession['profession']);
      loadedUserProfessions.add(UserProfessionModel(
          documentId: eachUserProfession['\$id'],
          userProfession: eachUserProfession['profession'],
          yearsOfExperiance: eachUserProfession['yearsOfExperiance']));
    }

    _userPofessionModel = loadedUserProfessions;
    notifyListeners();
    print(_userPofessionModel);
  }

  Future<void> createDocument(
      {required UserProfessionModel userProfessionModel}) async {
    await ApplicationConst.databases.createDocument(
      databaseId: ApplicationConst.jobDatabaseId,
      collectionId: ApplicationConst.jobCollectionId,
      documentId: "unique()",
      data: {
        'profession': userProfessionModel.userProfession,
        'yearsOfExperiance': userProfessionModel.yearsOfExperiance,
      },
    );

    notifyListeners();
  }

  Future<void> deleteDocument({required String id}) async {
    final itemIndex =
        _userPofessionModel.indexWhere((eachItem) => eachItem.documentId == id);
    _userPofessionModel.removeAt(itemIndex);

    await ApplicationConst.databases.deleteDocument(
        databaseId: ApplicationConst.jobDatabaseId,
        collectionId: ApplicationConst.jobCollectionId,
        documentId: id);

    notifyListeners();
  }

  Future<void> updateItem(
      String id, UserProfessionModel newUserProfModl) async {
    final prefessionIndex = _userPofessionModel
        .indexWhere((eachProfession) => eachProfession.documentId == id);
    if (prefessionIndex > 0) {
      await ApplicationConst.databases.updateDocument(
          databaseId: ApplicationConst.jobDatabaseId,
          collectionId: ApplicationConst.jobCollectionId,
          documentId: id,
          data: {
            'profession': newUserProfModl.userProfession,
            'yearsOfExperiance': newUserProfModl.yearsOfExperiance
          });

      _userPofessionModel[prefessionIndex] = newUserProfModl;
      notifyListeners();
    } else {
      print('----');
    }
  }
}
