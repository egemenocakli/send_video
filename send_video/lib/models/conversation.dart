import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:send_video/models/user_model.dart';


class Conversation extends StatefulWidget {
  final UserModel currentUser;
  final UserModel sohbetEdilenUser;

  Conversation({Key key, this.currentUser, this.sohbetEdilenUser});

  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Sohbet"),
      ),
      body: Center(
        child: Text("Konuşmalar"),
      ),
    );
  }
}
