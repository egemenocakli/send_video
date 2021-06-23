import 'package:flutter/cupertino.dart';

class UserModel{

  final String userId;
  final String name;
  final bool doctor;
  final bool patient;

  UserModel({@required this.userId, this.name, this.doctor, this.patient});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'doctor': doctor,
      'patient' : patient,
    };
  }

  UserModel.fromMap(Map<String, dynamic> map)
      : this.userId = map['userId'],
        this.name = map['name'],
        this.doctor = map['doctor'],
        this.patient = map['patient'];
}




