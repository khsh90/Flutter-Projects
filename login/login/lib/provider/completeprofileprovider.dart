import 'package:flutter/cupertino.dart';
import 'package:login/model/completeprofilemodel.dart';

import '../core/res/applicationcons.dart';

class CompleteProfileProvider with ChangeNotifier {
  List<CompleteProfileModel> _completeprofileData = [];

  List<CompleteProfileModel> get completeprofileData =>
      [..._completeprofileData];

// String get getDocumentId =>

  Future<void> createDocumentProfile(
      {required CompleteProfileModel completeProfileModel}) async {
    await ApplicationConst.database.createDocument(
      databaseId: ApplicationConst.databaseId,
      collectionId: ApplicationConst.userProfileCollectionId,
      documentId: "unique()",
      data: {
        'city': completeProfileModel.city,
      },
    );

    notifyListeners();
  }

  Future<void> getListOfDocument() async {
    final result = await ApplicationConst.database.listDocuments(
      databaseId: ApplicationConst.databaseId,
      collectionId: ApplicationConst.userProfileCollectionId,
    );
    final List<CompleteProfileModel> loadedUserProfessions = [];

    var extractedData = result.documents.map((e) => e.data).toList();

    for (var eachProfileData in extractedData) {
      loadedUserProfessions.add(CompleteProfileModel(
        id: eachProfileData['\$id'],
        city: eachProfileData['city'],
      ));
    }

    _completeprofileData = loadedUserProfessions;
    notifyListeners();
  }

  CompleteProfileModel getDocumentId(String id) =>
      _completeprofileData.firstWhere((eachUserData) => eachUserData.id == id);
}
