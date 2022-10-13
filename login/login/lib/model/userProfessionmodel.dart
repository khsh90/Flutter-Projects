import 'package:flutter/cupertino.dart';

class UserProfessionModel {
  final String documentId;
  final String userProfession;
  final int yearsOfExperiance;

  UserProfessionModel(
      {required this.documentId,
      required this.userProfession,
      required this.yearsOfExperiance});

  // UserProfessionModel.fromJson(Map<String, dynamic> json) {
  //   // userProfession = json['profession'];
  //   // yearsOfExperiance = json['yearsOfExperiance'];
  // }

  @override
  String toString() =>
      'docuemntid ${this.documentId} profession ${this.userProfession} yearsofExperiance ${this.yearsOfExperiance}';
}
