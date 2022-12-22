class UserModel {
  String? idUser, name, email, pic;
  int? heart, point;
  UserModel(
      {this.idUser, this.name, this.point, this.email, this.pic, this.heart});
  toJson() {
    return {
      'idUser': idUser,
      'email': email,
      'name': name,
      'pic': pic,
      'heart': heart,
      'point': point
    };
  }

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        idUser: json["idUser"],
        email: json["email"],
        name: json["name"],
        pic: json["pic"],
        point: json["point"],
        heart: json["heart"],
      );
}
