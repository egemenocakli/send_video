import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:send_video/models/user_model.dart';
import 'package:send_video/services/db/firestore_service.dart';

class MessageInputWidget extends StatefulWidget {
  const MessageInputWidget({
    Key key, @required this.fromUser, @required this.toUser,
  }) : super(key: key);

  final UserModel fromUser;
  final UserModel toUser;

  @override
  _MessageInputWidgetState createState() => _MessageInputWidgetState();
}

class _MessageInputWidgetState extends State<MessageInputWidget> {

  TextEditingController _messageInputController;
  FirestoreService _firestoreService;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _messageInputController = TextEditingController();
    _firestoreService = FirestoreService();
  }

  @override
  Widget build(BuildContext context) {


    return Container(
      color: Colors.transparent,//klavye mesaj kutumuz
      child: TextFormField(
        onTap: () {

        },
        controller: _messageInputController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey,style: BorderStyle.solid, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 3, style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          hintText: 'Mesaj yazınız',
          border: OutlineInputBorder(

              borderRadius: BorderRadius.all(Radius.circular(15))),
          prefixIcon: IconButton(
            icon: Icon(
              Icons.attach_file,
              size: 36,
              color: Colors.red,
            ),
            onPressed: () {},
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.send,
              size: 36,
              color: Colors.red,
            ),
            onPressed: () {
              _firestoreService.sendMessage(
                  fromUser: widget.fromUser,
                  toUser: widget.toUser,
                  messageText: _messageInputController.text);

              _messageInputController.text="";

            },
          ),
        ),
      ),
    );
  }
}