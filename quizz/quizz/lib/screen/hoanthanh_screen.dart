import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizz/core/fontgame.dart';

import '../core/colorgame.dart';
import '../pref/user_pre.dart';

class HoanThanh extends StatefulWidget {
  const HoanThanh({super.key});

  @override
  State<HoanThanh> createState() => _HoanThanhState();
}

class _HoanThanhState extends State<HoanThanh> {
  @override
  Widget build(BuildContext context) {
    int gtri = UserPref.getPoint();
    if (gtri > 16) {
      gtri = Random().nextInt(20);
      if (gtri < 3) {
        gtri = 5;
      }
    }
    String? title = "THÔNG BÁO";
    String? content =
        "Chúc mừng bạn đã hoàn thành thử thách\n Số câu đúng là ${gtri}.\nNhấn Ok để hoàn thành các thử thách còn lại.";

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(gradient: VColor.mainColor),
          child: Column(
            children: [
              Container(
                height: size.height * .1,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: Colors.white))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: size.height * .8,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(content,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: size.height * .05,
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, 'linhvuc', (route) => false);
                            },
                            child: Text("OK",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
