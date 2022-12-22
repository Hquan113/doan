import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizz/models/category.dart';

class CategoryData {
  static List<CategoryModel> listUser = [];
  static final caterogyCollection =
      FirebaseFirestore.instance.collection("linhvuc");

  //!: Get data
  static final categoriesData = caterogyCollection.orderBy("id").snapshots();
}
