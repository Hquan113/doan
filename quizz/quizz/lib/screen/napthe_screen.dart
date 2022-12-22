import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizz/pref/user_pre.dart';

import '../core/colorgame.dart';
import '../data/user_data.dart';

class NapTheScreen extends StatefulWidget {
  const NapTheScreen({super.key});

  @override
  State<NapTheScreen> createState() => _NapTheScreenState();
}

class _NapTheScreenState extends State<NapTheScreen> {
  var __controller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    __controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(gradient: VColor.mainColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: __controller,
                maxLength: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Container(
              child: TextButton(
                  onPressed: () {
                    if (__controller != null || __controller.text.length < 1) {
                      if (int.parse(__controller.text) > 0 &&
                          int.parse(__controller.text) < 1001) {
                        int gtri = int.parse(__controller.text);
                        showDialog(
                            context: context,
                            builder: ((context) => AlertDialog(
                                  content: Text("Nạp thành công ${gtri}.000"),
                                )));
                        UserData.addHeart(
                                heart: UserPref.getHeart() +
                                    int.parse(__controller.text))
                            .then((value) {
                          __controller.clear();
                        });
                      } else {
                        showDialog(
                            context: context,
                            builder: ((context) => AlertDialog(
                                  content: Text("Nạp không thành công."),
                                )));
                      }
                    }
                  },
                  child: Text("NẠP")))
        ],
      ),
    ));
  }
}
