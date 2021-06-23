import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class MessageModel {

  final String message;
  final Timestamp sendTime;

  MessageModel({ this.message, this.sendTime});

  Map<String, dynamic> toMap() {
    return {
      'userId': message,
      'name': sendTime,
    };
  }

  MessageModel.fromMap(Map<String, dynamic> map)
      : this.message = map['message'],
        this.sendTime = map['sendTime'];
  }

  










