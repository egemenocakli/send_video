import 'package:cloud_firestore/cloud_firestore.dart';


class MessageModel {

  final String message;
  final Timestamp sendtime;
  final String userId;
  final String name;
  final String userPhoto;


  MessageModel({
    this.message,
    this.sendtime,
    this.userId,
    this.name,
    this.userPhoto : "https://lh3.googleusercontent.com/ogw/ADea4I5wdvFHWqTQ5O9FUKcLN74uDpKXk4r1rjw_Zikh=s83-c-mo"
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'sendtime': sendtime,
      'userId': userId,
      'name': name,
      'userPhoto': userPhoto
    };
  }

  MessageModel.fromMap(Map<String, dynamic> map)
      : this.message = map['message'],
        this.sendtime = map['sendtime'],
        this.userId = map['userId'],
        this.name = map['name'],
        this.userPhoto = map['userPhoto'];

  }












