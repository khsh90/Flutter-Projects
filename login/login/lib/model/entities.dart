import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class UserCredintial with ChangeNotifier {
  int id;

  String firstName;
  String lastName;
  @Unique()
  int mobilePhone;
  String country;
  String city;
  String area;
  String password;
  //String mtName = 'khaled';
  @Backlink('userCredintial')
  final userDetialsProviders = ToMany<UserDetailPovider>();

  UserCredintial({
    this.id = 0,
    this.firstName = '',
    this.lastName = '',
    this.country = '',
    this.city = '',
    this.area = '',
    required this.mobilePhone,
    required this.password,
  });

  @override
  String toString() => '($id,$mobilePhone,$password)';
}

@Entity()
class UserDetailPovider {
  int id;

  final String profession;
  final int yearsOfExperiance;
  final userCredintial = ToOne<UserCredintial>();

  UserDetailPovider({
    this.id = 0,
    required this.profession,
    required this.yearsOfExperiance,
  });

  @override
  String toString() => '($id,$profession,$yearsOfExperiance)';
}

