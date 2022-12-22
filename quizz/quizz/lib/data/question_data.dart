import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionsData {
  static final questionsCollection =
      FirebaseFirestore.instance.collection("cauhoi");

  static final questionsDataa = FirebaseFirestore.instance
      .collection("cauhoi")
      .where("idlv", isEqualTo: 1)
      .snapshots();
  //!: Get data
  static Future getData(int id) async {
    await FirebaseFirestore.instance
        .collection("cauhoi")
        // .where("idlv", isEqualTo: 1)
        .snapshots();
  }
}
