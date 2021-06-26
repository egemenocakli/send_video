import 'package:cloud_firestore/cloud_firestore.dart';
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
  Future<List<MessageModel>> readMessages(UserModel userModel, UserModel contactUser) async {

    List<MessageModel> messages = [];

    await firestore.collection("users").doc(userModel.userId).collection("messages").doc(contactUser.userId).collection("messages").get().then((value) {

      for(var element in value.docs)
        {
          messages.add(MessageModel.fromMap(element.data()));
        }

    });

    return messages;

  }

  @override
  Future<bool> updateUserInfo(UserModel userModel) async {

    await firestore.collection("users").doc(userModel.userId).set({}).then((value) async {

      await firestore.collection("users").doc(userModel.userId).collection("user_info").doc(userModel.userId).set(userModel.toMap()).then((value) {
        return true;
      });

    });

  }

  @override
  Future<List<UserModel>> getUsers() async {

    List<UserModel> userList = [];

    await firestore.collection("users").get().then((value) async {

      for(var element in value.docs) {

        await firestore.collection("users").doc(element.id).collection("user_info").doc(element.id).get().then((value) {///BURADA 2 USER GÖSTERİYOR
          userList.add( UserModel.fromMap(value.data()));
        });
      }
    });

    return userList;

  }

  @override
  Future<List<UserModel>> getLastUsers() async {

    List<UserModel> userList = [];

      await firestore.collection("users").doc(FirebaseAuthService.userModel.userId).collection("messages").get().then((value) async {

        for(var element in value.docs)
          {
            UserModel userModel;
            userModel = await getUserFromId(element.id);

            userList.add(userModel);
          }
      });

        return userList;
  }

  @override
  Future<UserModel> getUserFromId(String userId) async {

  UserModel userModel;

  await firestore.collection("users").doc(userId).collection("user_info").doc(userId).get().then((value) {
    userModel = UserModel.fromMap(value.data());
  });

  return userModel;
  }

  @override
  Future<bool> sendMessage({UserModel fromUser, UserModel toUser, String messageText}) async {

    bool sended = false;
    MessageModel messageModel = MessageModel(message: messageText , ownerId: fromUser.userId, sendtime: Timestamp.now());

    //Current usera yazdırıyoruz
    await firestore.collection("users").doc(fromUser.userId).collection("messages").doc(toUser.userId).set({}).then((value) async {
      await firestore.collection("users").doc(fromUser.userId).collection("messages").doc(toUser.userId).collection("messages").add(messageModel.toMap()).then((value) {

      });
    }).then((value) async {

      //Karşıdaki kullanıcının messajlarına yazırıyoruz
      await firestore.collection("users").doc(toUser.userId).collection("messages").doc(fromUser.userId).set({}).then((value) async {
        await firestore.collection("users").doc(toUser.userId).collection("messages").doc(fromUser.userId).collection("messages").add(messageModel.toMap()).then((value) {

        });
      });
      sended = true;
    });


    return sended;

  }

}