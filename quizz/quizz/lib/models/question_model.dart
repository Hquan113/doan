class QuestionModel {
  String? name, A, B, C, D;
  int idlv;
  QuestionModel(
      {this.name, this.A, this.B, this.C, this.D, required this.idlv});

  toJson() {
    return {'name': name, 'A': A, 'B': B, 'C': C, 'D': D, 'idlv': idlv};
  }

  static QuestionModel fromJson(Map<String, dynamic> json) => QuestionModel(
        name: json["name"],
        A: json["A"],
        B: json["B"],
        C: json["C"],
        D: json["D"],
        idlv: json["idlv"],
      );
}
