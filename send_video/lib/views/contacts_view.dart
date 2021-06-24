import 'package:flutter/material.dart';
import 'package:send_video/models/message_model.dart';
import 'package:send_video/models/user_model.dart';
import 'package:send_video/views/chat_view.dart';
import 'package:send_video/widgets/contact_widget.dart';

class ContactsView extends StatefulWidget {
  const ContactsView(  {Key key, this.userList}) : super(key: key);

  @override
  _ContactsViewState createState() => _ContactsViewState();

  final List<UserModel> userList;
}

class _ContactsViewState extends State<ContactsView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Kişiler"),
      ),

      body: Container(
        child: widget.userList != null  ? ListView.builder(
          itemCount: widget.userList.length,
          itemBuilder: (context, index) {

            return ContactWidget(
              contactImage: "https://lh3.googleusercontent.com/ogw/ADea4I5wdvFHWqTQ5O9FUKcLN74uDpKXk4r1rjw_Zikh=s83-c-mo",
              contactName: "ali"
              ,);

          },) : Text("Kimse yok"),
      ),

    );
  }
}
