import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quizz/core/fontgame.dart';
import 'package:quizz/core/valgame.dart';
import 'package:quizz/data/user_data.dart';
import 'package:quizz/models/user_model.dart';

import '../core/colorgame.dart';

class BXHScreen extends StatefulWidget {
  const BXHScreen({super.key});

  @override
  State<BXHScreen> createState() => _BXHScreenState();
}

class _BXHScreenState extends State<BXHScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(gradient: VColor.mainColor),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              //!: BXH
              Text(
                "BXH",
                style: Vfont.dancingScript.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                    color: VColor.white),
              ),

              //!: Button

              //!: Content
              Container(
                  height: size.height * .77,
                  width: size.width,
                  child: StreamBuilder(
                    stream: UserData.userCollectionBxh,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data!.docs;
                        List<UserModel> lsUser = [];
                        for (var row in data) {
                          final r = row.data() as Map<String, dynamic>;
                          lsUser.add(UserModel(
                              name: r['name'],
                              pic: r['pic'],
                              idUser: r['idUser'],
                              point: r['point'],
                              heart: r['heart']));
                        }
                        return ListView.builder(
                            itemCount: lsUser.length,
                            itemBuilder: ((context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Vval.h, vertical: 10),
                                  child: Container(
                                    height: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        //!: Image && Name
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 15,
                                            ),

                                            //!: Top
                                            Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    shape: BoxShape.circle),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text('${index + 1}'),
                                                )),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            "${lsUser[index].pic}")),
                                                    color: Colors.green,
                                                    shape: BoxShape.circle),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                )),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text("\t${lsUser[index].name}",
                                                style: Vfont.dancingScript
                                                    .copyWith(
                                                        color: VColor.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold))
                                          ],
                                        ),

                                        //!: Score
                                        Text("${lsUser[index].point}",
                                            style: Vfont.dancingScript.copyWith(
                                                color: VColor.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                )));
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  )),
              const SizedBox(
                height: 20,
              ),
              //!: Top User
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: Container(
              //     height: size.height * .09,
              //     width: size.width,
              //     decoration: BoxDecoration(
              //         color: Colors.pink,
              //         borderRadius: BorderRadius.circular(30),
              //         border: Border.all(color: VColor.white)),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //         //!: Top
              //         Text("${new Random().nextInt(100)}",
              //             style: Vfont.sonsieOne.copyWith(color: Colors.white)),
              //         //!: Img
              //         Container(
              //           height: 60,
              //           width: 60,
              //           decoration: BoxDecoration(
              //               color: Colors.green, shape: BoxShape.circle),
              //         ),
              //         //!: Score
              //         Text("${new Random().nextInt(10000)}",
              //             style: Vfont.sonsieOne.copyWith(color: Colors.white))
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
