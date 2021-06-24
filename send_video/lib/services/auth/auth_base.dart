import 'package:send_video/models/message_model.dart';
import 'package:send_video/models/user_model.dart';

abstract class AuthBase{
  Future<UserModel> signInWithGoogle();
  Future<bool> signOut();
  Future<UserModel> currentUser();

}