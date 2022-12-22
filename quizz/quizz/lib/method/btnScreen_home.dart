import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizz/core/colorgame.dart';

import '../core/fontgame.dart';

class BTNOption extends StatelessWidget {
  String txt;
  final color;
  final size;
  FontWeight? fontweight;
  final backgroundColor;
  BTNOption(
      {required this.txt,
      this.color,
      this.backgroundColor,
      this.size,
      this.fontweight,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 12), color: VColor.black, blurRadius: 16),
          ],
          // color: backgroundColor ?? VColor.black,
          gradient: backgroundColor,
          shape: BoxShape.circle),
      child: Align(
        alignment: Alignment.center,
        child: Text(txt,
            style: Vfont.sonsieOne.copyWith(
                color: color ?? VColor.white,
                fontWeight: fontweight,
                fontSize: size)),
      ),
    );
  }
}
