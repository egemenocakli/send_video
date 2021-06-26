import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:send_video/models/message_model.dart';
import 'package:send_video/models/user_model.dart';
import 'package:send_video/services/auth/firebase_auth_service.dart';
import 'package:send_video/services/db/firestore_service.dart';
import 'package:send_video/widgets/message_input_widget.dart';
import 'package:send_video/widgets/message_widget.dart';

class ChatView extends StatefulWidget {

  final UserModel contactUser;

  const ChatView({Key key, @required this.contactUser}) : super(key: key);

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {


  UserModel currentUser;
  List<MessageModel> messages = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    currentUser = FirebaseAuthService.userModel;
  }




  @override
  Widget build(BuildContext context) {

    readMessages(currentUser, widget.contactUser);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.contactUser.name,
         // style: TextStyle(fontSize: 27),
        ),
      ),
      body: Column(

        children: [
          Expanded(
            flex: 9,
            child: messages != null ? ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {

              return MessageWidget(
                  messageText: messages[index].message,
                  sendTime: messages[index].sendtime,
                  ownMessage: messages[index].ownerId == currentUser.userId ? true : false,
              );

            }) : Container(),

          ),
          Expanded(
            flex: 1,
            child: MessageInputWidget(),
          ),
        ],
      ),
    );
  }


  Future<List<MessageModel>> readMessages(UserModel userModel, UserModel contactUser)
  async {
    FirestoreService firestoreService = FirestoreService();

    await firestoreService.readMessages(userModel, contactUser).then((value) {

      messages.clear();
      messages.addAll(value);

    });

    setState(() {
    });
  }

}


