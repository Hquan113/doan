import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../core/colorgame.dart';
import '../pref/user_pre.dart';

class ThachDau extends StatefulWidget {
  const ThachDau({super.key});

  @override
  State<ThachDau> createState() => _ThachDauState();
}

class _ThachDauState extends State<ThachDau> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(gradient: VColor.mainColor),
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
            left: 10,
            child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(UserPref.getUserPic())))),
          ),
          Positioned(
              child: Container(
            height: 200,
            width: 200,
            child: Center(child: Text("VS")),
          )),
          Positioned(
            right: 10,
            child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(UserPref.getUserPic())))),
          ),
          Positioned(
            bottom: 30,
            right: 10,
            child: Container(
              height: 60,
              width: 90,
              color: Colors.green,
              child: Center(child: Text("Bắt đầu")),
            ),
          )
        ]),
      ),
    );
  }
}
