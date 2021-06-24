import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:send_video/models/user_model.dart';
import 'package:send_video/services/auth/auth_base.dart';
import 'package:send_video/services/db/firestore_service.dart';

class FirebaseAuthService implements AuthBase{


  final _firebaseAuth = FirebaseAuth.instance;

  static UserModel userModel;

  @override
  Future<UserModel> signInWithGoogle() async {

    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount _googleUser = await _googleSignIn.signIn();

    if(_googleUser != null)
    {
      FirestoreService _firestoreService = FirestoreService();

      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      if(_googleAuth.idToken != null && _googleAuth.accessToken != null)
      {
        UserCredential userCredential = await _firebaseAuth.signInWithCredential(GoogleAuthProvider.credential(idToken: _googleAuth.idToken, accessToken:  _googleAuth.accessToken));

        userModel = _userFromFirebase(userCredential.user);

        _firestoreService.updateUserInfo(userModel);
        return userModel;
      }
      else
      {
        return null;
      }
    }
    else
    {
      return null;
    }

  }

  @override
  Future<bool> signOut() async {
    try
    {
      await _firebaseAuth.signOut();
      return true;
    }
    catch(e)
    {
      debugPrint("signOut sırasında hata oluştu: "+ e);
      return false;
    }

  }

  UserModel _userFromFirebase(User user)
  {
    if(user == null)
      return null;
    return UserModel(
        userId: user.uid,
        name: user.displayName,
        userPhoto: user.photoURL,
    );
  }

  @override
  Future<UserModel> currentUser() async {
    return _userFromFirebase(_firebaseAuth.currentUser);
  }


}