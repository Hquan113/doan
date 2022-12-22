import 'package:flutter/material.dart';

import '../core/colorgame.dart';
import '../core/fontgame.dart';
import '../core/valgame.dart';
import '../pref/user_pre.dart';

UserMethod({Color? color, required Size size, Color? txtColor}) {
  return Container(
    height: size.height * .1,
    color: color ?? Color.fromARGB(0, 255, 255, 255),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: Vval.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //!:  User
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage("${UserPref.getUserPic()}"))),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "${UserPref.getUsername()}",
                style: Vfont.dancingScript.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: txtColor ?? VColor.white),
              )
            ],
          ),
          //!:  Score
          Container(
            child: Text(
              "${UserPref.getHeart()} ❤️",
              style: Vfont.sonsieOne
                  .copyWith(fontSize: 18, color: txtColor ?? VColor.white),
            ),
          )
        ],
      ),
    ),
  );
}
