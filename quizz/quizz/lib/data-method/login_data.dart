import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizz/data/user_data.dart';
import 'package:quizz/models/user_model.dart';

import '../pref/user_pre.dart';

class LoginData {
  static final GoogleSignIn _googleSignIn = GoogleSignIn();
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static GoogleSignInAccount? _account;
  static LoginApp(context) async {
    _account = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await _account!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    await _firebaseAuth
        .signInWithCredential(credential)
        .then((value) => SaveUser(value));

    // UserPref.setUserId(id: _account!.id);
    UserPref.setUserPic(pic: _account!.photoUrl.toString());
    UserPref.setUsername(username: _account!.displayName.toString());
    Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
  }

  static Future LoginOutApp(context) async {
    _account = await _googleSignIn.signOut();
    UserPref.removeAll();
    Navigator.pushNamedAndRemoveUntil(context, 'dangnhap', (route) => false);
  }

  static SaveUser(UserCredential user) async {
    final _userCollection = UserData.userCollection;

    int heart = 5;
    int point = 0;
    int a = 0;
    await _userCollection
        .where("idUser", isEqualTo: user.user!.uid)
        .get()
        .then(((value) {
      value.docs.forEach((element) {
        heart = element.data()['heart'];
        UserPref.setUserId(id: element.data()['idUser']);
        UserPref.setPoint(point: element.data()['point']);

        a = 1;
      });
    }));

    await UserData.addUser(UserModel(
        idUser: user.user!.uid,
        email: user.user!.email!,
        name: user.user!.displayName!,
        pic: user.user!.photoURL!,
        point: point,
        heart: heart));
    print("---------------->${user.user!.uid}");
    if (a == 0) {
      UserPref.setUserId(id: user.user!.uid);
    }
    UserPref.setPoint(point: point);
    UserPref.setHeart(heart: heart);
    UserPref.setUserEmail(id: user.user!.email!);
  }
}
