import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:send_video/models/user_model.dart';


class MessageModel {

  final String message;
  final Timestamp sendtime;
  final String owner;
  final UserModel userModel;

  MessageModel({ this.message, this.sendtime, this.owner, this.userModel });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'sendtime': sendtime,
      'owner': owner,
      'userModel': userModel
    };
  }

  MessageModel.fromMap(Map<String, dynamic> map)
      : this.message = map['message'],
        this.sendtime = map['sendtime'],
        this.owner = map['owner'],
        this.userModel = map['userModel'];
  }












