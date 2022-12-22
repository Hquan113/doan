import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizz/core/colorgame.dart';
import 'package:quizz/core/fontgame.dart';
import 'package:quizz/core/valgame.dart';
import 'package:quizz/data/category_data.dart';
import 'package:quizz/method/nextPage.dart';
import 'package:quizz/models/category.dart';
import 'package:quizz/screen/main_screen.dart';

import '../method/userMethod.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({super.key});

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
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
              //!: User
              UserMethod(size: size),
              //!: Option
              Container(
                  height: size.height * .87,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: CategoryData.categoriesData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data!.docs;
                        List<CategoryModel> lsCategories = [];
                        for (var row in data) {
                          final r = row.data() as Map<String, dynamic>;
                          lsCategories.add(CategoryModel(
                              name: r['name'], img: r['img'], id: r['id']));
                        }

                        return ListView.builder(
                          itemCount: lsCategories.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: Vval.w),
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 12),
                                        color: VColor.black,
                                        blurRadius: 16),
                                  ],
                                  color: VColor.colorls[new Random()
                                      .nextInt(VColor.colorls.length)],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Stack(
                                  children: [
                                    //!: Image
                                    Positioned(
                                      top: 10,
                                      right: 20,
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "${lsCategories[index].img}"),
                                          ),
                                        ),
                                      ),
                                    ),
                                    //!: Name
                                    Positioned(
                                      left: 30,
                                      top: 46,
                                      child: Container(
                                        height: 46,
                                        width: 120,
                                        child: Text(
                                          "${lsCategories[index].name}",
                                          style: Vfont.dancingScript.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 36,
                                              color: VColor.white),
                                        ),
                                      ),
                                    ),
                                    //!: BTN
                                    Positioned(
                                      bottom: 50,
                                      left: 20,
                                      child: GestureDetector(
                                        onTap: () => NextPage(
                                            context,
                                            MainScreen(
                                                idlv: lsCategories[index].id)),
                                        child: Container(
                                          height: 46,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: Offset(0, 12),
                                                    color: VColor.black,
                                                    blurRadius: 16),
                                              ],
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "CHƠI",
                                              style: Vfont.dancingScript
                                                  .copyWith(
                                                      color: VColor.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
