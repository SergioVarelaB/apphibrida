

import 'package:apphibridatrabajos/models/user/address.dart';
import 'package:apphibridatrabajos/models/user/document.dart';

class Profile {

  String name;
  String lastname;
  String email;
  String password;
  String phone;
  String birthDate;
  Address address;
  String gender;
  String maritalStatus;
  String profileImg;
  String degree;
  String roles;
  Document requiredDocuments;

  Profile({
      this.name,
      this.lastname,
      this.email,
      this.password,
      this.phone,
      this.birthDate,
      this.address,
      this.gender,
      this.maritalStatus,
      this.profileImg,
      this.degree,
      this.roles,
      this.requiredDocuments});


  factory Profile.fromJson(Map<String, dynamic> json){

    return Profile(
        name: json['name'],
        lastname: json['lastname'],
        email: json['email'],
        password: json['startedDate'],
        phone: json['phone'],
        birthDate: json['birthDate'],
        address: Address.fromJson(json['isActive']),
        gender: json['gender'],
        maritalStatus: json['maritalStatus'],
        profileImg: json['profileImg'],
        degree: json['degree'],
        roles: json['roles'],
        requiredDocuments: Document.fromJson(json['requiredDocuments'])
    );
  }

  Map<String, dynamic> toJson() => {

    "name": name,
    "lastname": lastname,
    "email": email,
    "password": password,
    "phone": phone,
    "birthDate": birthDate,
    "address": address,
    "gender": gender,
    "maritalStatus": maritalStatus,
    "profileImg": profileImg,
    "degree": degree,
    "roles": roles,
    "requiredDocuments": requiredDocuments
  };
}