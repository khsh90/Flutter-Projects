import 'package:flutter/cupertino.dart';
import 'package:login/objectbox.g.dart';
import 'package:login/provider/usercredintial.dart';

class UserDetailsPovider with ChangeNotifier {
  int id;
  // final String fullName;
  final String country;
  final String city;
  // final String mobilePhone;
  final String profession;
  final String yearsOfExperiance;

  final userCredintial = ToOne<UserCredintial>();

  UserDetailsPovider(
      {this.id = 0,
      // required this.fullName,
      required this.country,
      required this.city,
      //  required this.mobilePhone,
      required this.profession,
      required this.yearsOfExperiance});

  @override
  String toString() => '($id,$country,$city,$profession,$yearsOfExperiance)';
}
