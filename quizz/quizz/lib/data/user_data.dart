import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizz/models/user_model.dart';
import 'package:quizz/pref/user_pre.dart';

class UserData {
  static List<UserModel> listUser = [];
  static final userCollection = FirebaseFirestore.instance.collection("users");
  static final userCollectionBxh = FirebaseFirestore.instance
      .collection("users")
      .orderBy("point", descending: true)
      .snapshots();
//!: Stream
  static final UserStreamData = FirebaseFirestore.instance
      .collection("users")
      .orderBy("score")
      .snapshots();

//!: Data
  static Future GetUserData() async {
    await userCollection.get().then(
      (value) {
        value.docs.forEach(
          (element) {
            listUser.add(
              new UserModel(
                name: element.data()['name'],
                idUser: element.data()['idUser'],
                email: element.data()['email'],
                pic: element.data()['pic'],
                heart: element.data()['heart'],
              ),
            );
          },
        );
      },
    );
  }

  static Future addUser(UserModel userModel) async {
    return await userCollection.doc(userModel.idUser).set(userModel.toJson());
  }

  static Future addHeart({required heart}) async {
    UserPref.setHeart(heart: heart);
    print("ID -------------------->${UserPref.getUserId()}");
    userCollection.doc(UserPref.getUserId()).update({
      "idUser": UserPref.getUserId(),
      "name": UserPref.getUsername(),
      "pic": UserPref.getUserPic(),
      "heart": UserPref.getHeart(),
      "point": UserPref.getPoint(),
      "email": UserPref.getUserEmail()
    });
  }
}
