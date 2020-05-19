


import 'package:apphibridatrabajos/models/user/profile.dart';

class User {

  String userId;
  /*String displayName;
  Profile profile;
  bool terms;*/


  User({this.userId,/* this.displayName, this.profile, this.terms*/});

  factory User.fromJson(Map<String, dynamic> json){

    return User(
        userId: json['userId'],
        /*displayName: json['displayName'],
        profile: Profile.fromJson(json['profile']),
        terms: json['terms']*/
    );
  }

  Map<String, dynamic> toJson() => {

    "userId": userId,
    /*"displayName": displayName,
    "profile": profile,
    "terms": terms*/
  };

}