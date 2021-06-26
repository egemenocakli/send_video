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
    this.userPhoto : "https://cdn1.iconfinder.com/data/icons/mix-color-4/502/Untitled-1-512.png"
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




