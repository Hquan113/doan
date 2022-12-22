import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../core/colorgame.dart';
import '../pref/user_pre.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(gradient: VColor.mainColor),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 20,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    //   color: Colors.red,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(UserPref.getUserPic()))),
              ),
            ),
            Positioned(
              top: 100,
              child: Container(
                height: 100,
                child: Center(
                  child: Text(
                    UserPref.getUsername(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 200,
              child: Container(
                height: 100,
                child: Text(
                  "${UserPref.getHeart().toString()} ❤️",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Positioned(
              top: 260,
              child: Container(
                height: 100,
                child: Text(
                  "Tổng số câu đúng : ${UserPref.getPoint().toString()} câu",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
