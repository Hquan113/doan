class CategoryModel {
  final String? name, img;
  final int? id;

  CategoryModel({required this.name, this.id, this.img});
}

List<CategoryModel> lstCategory = [
  CategoryModel(name: "Bóng đá"),
  CategoryModel(name: "Quốc gia"),
  CategoryModel(name: "Tổng hợp")
];
