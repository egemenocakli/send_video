import 'package:flutter/cupertino.dart';

class UserModel{

   String userId;
   String name;
   bool doctor;
   bool patient;
   String userPhoto;

  UserModel({
    @required this.userId,
    this.name,
    this.doctor,
    this.patient,
    this.userPhoto : "https://lh3.googleusercontent.com/ogw/ADea4I5wdvFHWqTQ5O9FUKcLN74uDpKXk4r1rjw_Zikh=s83-c-mo"
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'doctor': doctor,
      'patient' : patient,
      'userPhoto' : userPhoto,
    };
  }

  UserModel.fromMap(Map<String, dynamic> map)
      : this.userId = map['userId'],
        this.name = map['name'],
        this.doctor = map['doctor'],
        this.patient = map['patient'],
        this.userPhoto = map['userPhoto'];

}




