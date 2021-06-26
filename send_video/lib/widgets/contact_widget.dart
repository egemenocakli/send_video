import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:send_video/models/user_model.dart';
import 'package:send_video/views/chat_view.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    Key key,
    @required this.contactUser,
  }) : super(key: key);

  final UserModel contactUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: ClipOval(
            child: Image.network(
              contactUser.userPhoto,
          width: 50,
          height: 50,
        )),
        title: (Text(contactUser.name)),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatView(contactUser: contactUser)));
        },
      ),
    );
  }
}
