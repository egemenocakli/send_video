import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:send_video/models/message_model.dart';
import 'package:send_video/models/user_model.dart';
import 'package:send_video/services/auth/firebase_auth_service.dart';
import 'package:send_video/services/db/firestore_service.dart';
import 'package:send_video/viewmodels/home_viewmodel.dart';
import 'package:send_video/views/chat_view.dart';
import 'package:send_video/widgets/contact_widget.dart';

import 'contacts_view.dart';
import 'login_view.dart';

class HomeView extends StatefulWidget {


  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  HomeViewModel _homeViewModel = HomeViewModel();

  List<UserModel> _lastUsers = [];

  @override
  Widget build(BuildContext context) {

    _homeViewModel.getLastUsers().then((value) {
      _lastUsers = value;

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
             iconSize: 30,
              alignment: Alignment.bottomCenter,
            ),
          ],
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Görüşmeler",
              //style: TextStyle(fontSize: 27),
            ),
          ),
        ),
      ),


      floatingActionButton: CreateMessageFabWidget(),

      body: _lastUsers.length > 0 ? ListView.builder(
        itemCount: _lastUsers.length,
        itemBuilder: (context, index) {

       return ContactWidget(contactUser: _lastUsers[index],); //todo: konuşulacak user gelecek

      },) : Text("Görüşme yok"),
    );
  }
}

class CreateMessageFabWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.message),
      backgroundColor: Colors.red,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ContactsView()));
      },
    );
  }
}


