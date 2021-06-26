import 'package:flutter/material.dart';
import 'package:send_video/services/auth/firebase_auth_service.dart';
import 'package:send_video/views/home_view.dart';

class LoginView extends StatelessWidget {

  FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(

                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // background
                  onPrimary: Colors.white, // foreground
                ),

                onPressed: () {
              _firebaseAuthService.signInWithGoogle().then((value){

                debugPrint("oturum acildi: " + value.name);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView()));

              });
            }, child: Text("Google ile giriş"))
          ],
        ),
      ),
    );
  }
}


