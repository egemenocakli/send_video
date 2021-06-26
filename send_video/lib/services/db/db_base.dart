import 'package:send_video/models/message_model.dart';
import 'package:send_video/models/user_model.dart';


abstract class DbBase{



  Future<MessageModel> readMessage(UserModel userModel, String messageId);
  Future<List<MessageModel>> readMessages(UserModel userModel, UserModel contactUser);
  Future<bool> sendMessage({UserModel fromUser, UserModel toUser, String messageText});
  Future<MessageModel> deleteMessage();

  Future<bool> updateUserInfo(UserModel userModel);
  Future<List<UserModel>> getUsers();
  Future<List<UserModel>> getLastUsers();
  Future<UserModel> getUserFromId(String userId);




}