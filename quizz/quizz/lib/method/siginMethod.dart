import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz/screen/home_screen.dart';

class SiginMethod {
  static siginMethod(context) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (_) => HomeScreen()));
  }
}
