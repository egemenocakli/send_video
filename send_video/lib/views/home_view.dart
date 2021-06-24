import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:send_video/models/message_model.dart';
import 'package:send_video/services/auth/firebase_auth_service.dart';
import 'package:send_video/services/db/firestore_service.dart';
import 'package:send_video/viewmodels/home_viewmodel.dart';
import 'package:send_video/views/chat_view.dart';
import 'package:send_video/widgets/contact_widget.dart';

import 'login_view.dart';

class HomeView extends StatefulWidget {


  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  HomeViewModel _homeViewModel = HomeViewModel();

  List<MessageModel> _messageList = [];

  @override
  Widget build(BuildContext context) {

     _homeViewModel.readMessages(FirebaseAuthService.userModel).then((value) {

      _messageList = value;
      setState(() {});
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(100, 70),
        child: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                _firebaseAuthService.signOut().then((value) {debugPrint("Çıkış yapıldı");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
                });
              },
              icon: Icon(Icons.exit_to_app),
              iconSize: 40,
              alignment: Alignment.bottomCenter,
            ),
          ],
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Görüşmeler",
              style: TextStyle(fontSize: 27),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        child: FloatingActionButton(
          child: Icon(Icons.message),
          backgroundColor: Colors.red,
          onPressed: () {},
        ),
      ),

      ///yeni mesaj için tıklama butonu
      body: _messageList.length > 0 ? ListView.builder(
        itemCount: _messageList.length,
        itemBuilder: (context, index) {

        return ContactWidget(
          contactImage: "https://lh3.googleusercontent.com/ogw/ADea4I5wdvFHWqTQ5O9FUKcLN74uDpKXk4r1rjw_Zikh=s83-c-mo",
          contactName: "Emre"
          ,);

      },) : Text("Görüşme yok"),
    );
  }
}


