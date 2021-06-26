import 'package:flutter/material.dart';
import 'package:send_video/models/message_model.dart';
import 'package:send_video/models/user_model.dart';
import 'package:send_video/services/db/firestore_service.dart';
import 'package:send_video/views/chat_view.dart';
import 'package:send_video/widgets/contact_widget.dart';

class ContactsView extends StatefulWidget {

  @override
  _ContactsViewState createState() => _ContactsViewState();

}

class _ContactsViewState extends State<ContactsView> {

  List<UserModel> userList = [];
  FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {

    getUsers();

    return Scaffold(

      appBar: AppBar(
        title: Text("Kişiler"),
      ),

      body: Container(
        child: userList.length > 0 ? ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {

            return ContactWidget(contactUser: userList[index]);

          },) : Text("Kimse yok"),
      ),

    );
  }

  Future<void> getUsers()
  async {
    await _firestoreService.getUsers().then((value) {

      userList.clear();
      userList.addAll(value);

      setState(() {});

    });

  }
}
