import 'package:flutter/material.dart';

class VColor {
  static const white = Colors.white;
  static const black = Colors.black;
  static final bg1 = Color.fromARGB(255, 52, 147, 230);
  static final bg2 = Color.fromARGB(255, 236, 110, 173);
  static final mainColor = LinearGradient(
      colors: [bg1, bg2],
      begin: Alignment.topCenter,
      end: Alignment.bottomRight);

  static final a1 = Color.fromARGB(255, 192, 204, 255);
  static final a2 = Color.fromARGB(255, 90, 189, 222);

  static final aa = LinearGradient(
      colors: [a1, a2], begin: Alignment(1, 0), end: Alignment(0, 1));

  static final b1 = Color.fromARGB(255, 105, 105, 230);
  static final b2 = Color.fromARGB(64, 0, 85, 244);
  static final bb = LinearGradient(
      colors: [b1, b2], begin: Alignment(1, 0), end: Alignment(0, 1));
  static final c1 = Color.fromARGB(255, 168, 208, 145);
  static final c2 = Color.fromARGB(97, 192, 177, 147);
  static final cc = LinearGradient(
      colors: [c1, c2], begin: Alignment(1, 0), end: Alignment(0, 1));

  static final d1 = Color.fromARGB(214, 232, 107, 98);
  static final d2 = Color.fromARGB(70, 244, 67, 54);
  static final dd = LinearGradient(
      colors: [d1, d2], begin: Alignment(1, 0), end: Alignment(0, 1));

  static final e1 = Color.fromARGB(255, 117, 213, 120);
  static final e2 = Color.fromARGB(106, 73, 224, 78);
  static final ee = LinearGradient(
      colors: [e1, e2], begin: Alignment(1, 0), end: Alignment(0, 1));

  static final f1 = Color.fromARGB(255, 235, 210, 21);
  static final f2 = Color.fromARGB(106, 224, 148, 73);
  static final ff = LinearGradient(
      colors: [f1, f2], begin: Alignment(1, 0), end: Alignment(0, 1));

  static final colorls = [
    Colors.brown.shade300,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.pinkAccent,
    Colors.yellow.shade300,
    Colors.orange.shade300,
    Colors.pink.shade300,
    Colors.blue.shade300,
    Colors.green.shade300,
    Colors.red.shade300,
    Colors.purple.shade300,
  ];
}
