import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:send_video/models/message_model.dart';
import 'package:send_video/models/user_model.dart';
import 'package:send_video/services/auth/firebase_auth_service.dart';
import 'package:send_video/services/db/db_base.dart';

class FirestoreService implements DbBase
{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();

  @override
  Future<MessageModel> deleteMessage() {

  }

  @override
  Future<MessageModel> readMessage(UserModel userModel, String messageId) async{

   MessageModel messageModel;

  await firestore.collection("users").doc(userModel.userId).collection("messages").doc(messageId).get().then((value) {
     messageModel =  MessageModel.fromMap(value.data());
    });

    return  messageModel;

  }

  @override
  Future<MessageModel> sendMessage() {


  }

  @override
  Future<List<MessageModel>> readMessages(UserModel userModel) async {

    List<MessageModel> messages = [];

    await firestore.collection("users").doc(userModel.userId).collection("messages").get().then((value) {

      for(var element in value.docs)
        {
          messages.add(MessageModel.fromMap(element.data()));
        }

    });

    return messages;

  }

  @override
  Future<bool> updateUserInfo(UserModel userModel) async {

    await firestore.collection("users").doc(userModel.userId).collection("user_info").doc(userModel.userId).set(userModel.toMap()).then((value) {

      return true;
    });

  }

  @override
  Future<List<UserModel>> getUsers() async {

    List<UserModel> userList = [];

    

  }
}