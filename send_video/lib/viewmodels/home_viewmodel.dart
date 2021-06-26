import 'package:flutter/cupertino.dart';
import 'package:send_video/models/message_model.dart';
import 'package:send_video/models/user_model.dart';
import 'package:send_video/services/auth/firebase_auth_service.dart';
import 'package:send_video/services/db/db_base.dart';
import 'package:send_video/services/db/firestore_service.dart';

class HomeViewModel implements DbBase{

  FirestoreService _firestoreService = FirestoreService();

  @override
  Future<MessageModel> deleteMessage() {
  }

  @override
  Future<MessageModel> readMessage(UserModel userModel, String messageId) {
  }

  @override
  Future<List<MessageModel>> readMessages(UserModel userModel, UserModel contactUser) async {

  //todo  return await _firestoreService.readMessages(FirebaseAuthService.userModel);

  }

  @override
  Future<MessageModel> sendMessage() {
  }


  @override
  Future<bool> updateUserInfo(UserModel userModel) {
  }

  @override
  Future<List<UserModel>> getUsers() async {

    return await _firestoreService.getUsers();

  }





}