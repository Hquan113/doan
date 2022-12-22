import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:quizz/core/colorgame.dart';
import 'package:quizz/core/fontgame.dart';
import 'package:quizz/core/valgame.dart';
import 'package:quizz/data-method/login_data.dart';
import 'package:quizz/method/nextPage.dart';
import 'package:quizz/pref/user_pre.dart';
import 'package:quizz/screen/bxh_screen.dart';
import 'package:quizz/screen/napthe_screen.dart';
import 'package:quizz/screen/option_screen.dart';

import '../method/btnScreen_home.dart';
import 'ProfileScreen.dart';
import 'ThachDau.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                height: 46,
              ),
              Container(
                height: size.height * .33,
                child: Image.asset("assets/imgs/1.webp"),
              ),
              //!: Button options
              Container(
                height: size.height * .48,
                child: Stack(
                  children: [
                    Positioned(
                      top: 100,
                      child:
                          Container(height: 40, width: 40, child: Container()),
                    ),
                    Positioned(
                      bottom: 300,
                      left: 80,
                      child: GestureDetector(
                        onTap: () => NextPage(context, BXHScreen()),
                        child: BTNOption(
                          backgroundColor: VColor.aa,
                          txt: "BXH",
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 190,
                      left: 140,
                      child: GestureDetector(
                        onTap: () => NextPage(context, NapTheScreen()),
                        child: BTNOption(
                          backgroundColor: VColor.bb,
                          txt: "Nạp\nngay",
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 190,
                      left: 20,
                      child: GestureDetector(
                        onTap: () {},
                        child: BTNOption(
                          backgroundColor: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomRight,
                              colors: [Colors.grey, Colors.blue]),
                          txt: "Bạn bè",
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 140,
                      child: GestureDetector(
                        onTap: () {
                          NextPage(context, ThachDau());
                        },
                        child: BTNOption(
                          backgroundColor: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.grey,
                                Color.fromARGB(255, 40, 243, 33)
                              ]),
                          txt: "VS",
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 130,
                      right: 60,
                      child: GestureDetector(
                        onTap: () => NextPage(context, ProfileScreen()),
                        child: BTNOption(
                          backgroundColor: VColor.ff,
                          txt: "Profile",
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      right: 120,
                      child: BTNOption(
                        backgroundColor: VColor.cc,
                        txt: "Cài đặt",
                      ),
                    ),
                    Positioned(
                      bottom: 90,
                      left: 50,
                      child: GestureDetector(
                        onTap: () async {
                          LoginData.LoginOutApp(context);
                          print("Da dang xuat");
                        },
                        child: BTNOption(
                          backgroundColor: VColor.ee,
                          txt: "Đăng\nxuất",
                        ),
                      ),
                    ),
                    Positioned(
                      top: 90,
                      right: 50,
                      child: GestureDetector(
                        onTap: () {
                          exit(1);
                        },
                        child: BTNOption(
                          backgroundColor: VColor.dd,
                          txt: "Thoát",
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //!: Button Play
              GestureDetector(
                onTap: () {
                  if (UserPref.getHeart() <= 0) {
                    final snackBar = SnackBar(
                      /// need to set following properties for best effect of awesome_snackbar_content
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: DecoratedBox(
                        decoration: BoxDecoration(),
                        child: AwesomeSnackbarContent(
                          title: 'Thông báo!',
                          message:
                              '\t\tBạn đã hết lượt chơi vui lòng nạp thẻ để tiếp tục...',

                          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                          contentType: ContentType.failure,
                        ),
                      ),
                    );

                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  } else {
                    NextPage(context, OptionsScreen());
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    height: size.height * .06,
                    width: size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 72, 225, 77),
                            Color.fromARGB(134, 108, 194, 111)
                          ],
                          begin: Alignment(1, 0),
                          end: Alignment(0, 1),
                        ),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 12),
                              color: VColor.black,
                              blurRadius: 16),
                        ],
                        borderRadius: BorderRadius.circular(30)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "CHƠI",
                        style: Vfont.dancingScript.copyWith(
                            color: VColor.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
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
