import 'package:send_video/models/message_model.dart';
import 'package:send_video/models/user_model.dart';


abstract class DbBase{
  /// İçeriği olmayan metotlar tanımlanır, Kullanmak için bir sınıfa uygulanması gerekli. Uygulandığı yerde bu metotların içeriğii doldurulması gerekli.
  ///

  Future<MessageModel> readMessage(UserModel userModel, String messageId);
  Future<List<MessageModel>> readMessages(UserModel userModel);
  Future<MessageModel> sendMessage();
  Future<MessageModel> deleteMessage();

  Future<bool> updateUserInfo(UserModel userModel);




}