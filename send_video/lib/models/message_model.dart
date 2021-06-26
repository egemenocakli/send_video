import 'package:cloud_firestore/cloud_firestore.dart';


class MessageModel {

  final String message;
  final Timestamp sendtime;
  final String ownerId;


  MessageModel({
    this.message,
    this.sendtime,
    this.ownerId
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'sendtime': sendtime,
      'ownerId' : ownerId
    };
  }

  MessageModel.fromMap(Map<String, dynamic> map)
      : this.message = map['message'],
        this.sendtime = map['sendtime'],
        this.ownerId = map['ownerId'];

  }












