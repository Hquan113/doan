import 'dart:async';
import 'dart:math';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizz/core/colorgame.dart';
import 'package:quizz/core/fontgame.dart';
import 'package:quizz/data/question_data.dart';
import 'package:quizz/data/user_data.dart';
import 'package:quizz/method/nextPage.dart';
import 'package:quizz/models/question_model.dart';
import 'package:quizz/screen/hoanthanh_screen.dart';
import 'package:quizz/screen/home_screen.dart';

import '../pref/user_pre.dart';

class MainScreen extends StatefulWidget {
  var idlv;

  MainScreen({super.key, required this.idlv});

  @override
  State<MainScreen> createState() => _MainScreenState(idlv: idlv);
}

class _MainScreenState extends State<MainScreen> {
  UpdateHeart() {
    if (heart > -1 && isGameOver == false) {
      UserData.addHeart(heart: heart);
      setState(() {});
    }
  }

  static final colorls = [
    Colors.brown.shade300,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.pinkAccent,
    Colors.yellow.shade300,
    Colors.orange.shade300,
    Colors.pink.shade300,
    Colors.blue.shade300,
    Colors.green.shade300,
    Colors.red.shade300,
    Colors.purple.shade300,
  ];

  them15s() {
    if (UserPref.getHeart() < 2) {
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Thông báo!',
          message: '\t\tBạn không đủ điều kiện!',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    } else {
      seconds += 15;
      heart -= 2;
      UpdateHeart();
      setState(() {});
    }
  }

  int sumSex = 0;
  nextQues(data) {
    if (currentQuestionIndex < SL) {
      if (isLoad == false) {
        lsoption.add(data[currentQuestionIndex]["a"]);
        lsoption.add(data[currentQuestionIndex]["b"]);
        lsoption.add(data[currentQuestionIndex]["c"]);
        lsoption.add(data[currentQuestionIndex]["d"]);
        lsoption.shuffle();

        isLoad = true;
      }
    }
  }

  next() {
    if (UserPref.getHeart() < 3) {
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Thông báo!',
          message: '\t\tBạn không đủ điều kiện!',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    } else {
      _timer!.cancel();
      seconds = 15;
      currentQuestionIndex++;
      startTimer();
      heart -= 3;
      UpdateHeart();

      setState(() {});
    }
  }

  var idlv;
  late Future qs;
  int SL = 0;
  var currentQuestionIndex = 0;
  var isGameOver = false;
  Timer? _timer;
  int seconds = 15;
  var heart = UserPref.getHeart();

  startTimer() {
    if (heart > 0) {
      if (isGameOver == false) {
        _timer = Timer.periodic(Duration(seconds: 1), (timer) {
          if (isGameOver == false) {
            setState(() {
              seconds = seconds - 1;

              setState(() {});
              if (seconds < 0) {
                _timer!.cancel();
                seconds = 15;

                lsoption = [];
                currentQuestionIndex++;
                isLoad = false;
                heart--;

                UpdateHeart();
              }
            });
          }
        });
      } else {}
    } else {
      print("aaaa");
      _timer!.cancel();
      heart = 0;
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: Text("Hết lượt rồi...>_<"),
                content: Text("Bạn sẽ được chuyển sang màn hình khác."),
              )));
      Future.delayed(Duration(milliseconds: 2000), () {
        Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
      });
    }
  }

  _MainScreenState({required this.idlv});
  @override
  void initState() {
    super.initState();
    qs = FirebaseFirestore.instance
        .collection("cauhoi")
        .where('idlv', isEqualTo: idlv)
        //   .where(["a","b"],isEqualTo: ["",""])
        .get();
    startTimer();
  }

  resetColor() async {
    optionsColors = [
      Color.fromARGB(255, 233, 188, 133),
      Color.fromARGB(255, 233, 188, 133),
      Color.fromARGB(255, 233, 188, 133),
      Color.fromARGB(255, 233, 188, 133),
    ];
  }

  var optionsColors = [
    Color.fromARGB(255, 233, 188, 133),
    Color.fromARGB(255, 233, 188, 133),
    Color.fromARGB(255, 233, 188, 133),
    Color.fromARGB(255, 233, 188, 133),
  ];
  List<QuestionModel> lstQuestions = [];
  List<dynamic> lsoption = [];
  var isLoad = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
          children: [
            //!: Top
            Container(
              height: size.height * .12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //!: user
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("${UserPref.getUserPic()}")),
                      shape: BoxShape.circle,
                    ),
                  ),
                  //!:  Time
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.amber),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "${seconds}",
                          style: Vfont.dancingScript.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  //!: Money
                  Container(
                    height: 50,
                    width: 50,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("${heart} ❤️",
                          style: Vfont.dancingScript
                              .copyWith(color: Colors.white, fontSize: 24)),
                    ),
                  ),
                ],
              ),
            ),
            //!: Content
            Container(
                height: size.height * .7,
                child: FutureBuilder(
                  future: qs,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data.docs;
                      SL = data.length;

                      nextQues(data);

                      if (currentQuestionIndex < SL) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: size.height * .7,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Số câu hỏi ${currentQuestionIndex + 1}/${data.length}",
                                        style: Vfont.dancingScript.copyWith(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: colorls[new Random()
                                                .nextInt(colorls.length)]),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                //!: Cau hoi
                                Container(
                                  height: size.height * .18,
                                  width: size.width,
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 12),
                                          color: Color.fromARGB(148, 0, 0, 0),
                                          blurRadius: 16),
                                    ],
                                    borderRadius: BorderRadius.circular(30),
                                    color: Color.fromARGB(191, 149, 77, 211),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${data[currentQuestionIndex]['name']}",
                                      style: Vfont.dancingScript.copyWith(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: size.height * .44,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: lsoption.length,
                                      itemBuilder: ((context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            String gtri = "";
                                            setState(() {
                                              if (!isGameOver) {
                                                _timer!.cancel();

                                                if (data[currentQuestionIndex]
                                                            ['a']
                                                        .toString() ==
                                                    lsoption[index]
                                                        .toString()) {
                                                  gtri = "Đúng";
                                                  heart++;
                                                  UserPref.setPoint(
                                                      point:
                                                          UserPref.getPoint() +
                                                              1);

                                                  UpdateHeart();
                                                  optionsColors[index] =
                                                      Colors.green;
                                                } else {
                                                  gtri = "Sai";

                                                  heart--;
                                                  UpdateHeart();
                                                  optionsColors[index] =
                                                      Colors.red;
                                                }

                                                showDialog(
                                                    context: context,
                                                    builder: (_) => AlertDialog(
                                                          title: Text(
                                                              "Bạn đã chọn ${gtri}"),
                                                          content: Text(
                                                              "Đáp án câu này là : ${data[currentQuestionIndex]['a'].toString()}"),
                                                        ));

                                                Future.delayed(
                                                    Duration(
                                                        milliseconds: 1000),
                                                    () {
                                                  seconds = 15;
                                                  isLoad = false;
                                                  lsoption = [];
                                                  if (currentQuestionIndex + 1 <
                                                      SL) {
                                                    currentQuestionIndex++;
                                                  } else {
                                                    isGameOver = true;
                                                    Navigator
                                                        .pushNamedAndRemoveUntil(
                                                            context,
                                                            'HoanThanh',
                                                            (route) => false);
                                                  }
                                                  isLoad = false;

                                                  setState(() {});
                                                  seconds = 15;
                                                  startTimer();
                                                  resetColor();
                                                  setState(() {});
                                                });
                                              } else {
                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                        context,
                                                        'home',
                                                        (route) => false);
                                              }
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                            child: Material(
                                              elevation: 10,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              shadowColor:
                                                  Color.fromARGB(133, 0, 0, 0),
                                              child: Container(
                                                height: size.height * .08,
                                                decoration: BoxDecoration(
                                                  color: optionsColors[index],
                                                  boxShadow: [
                                                    BoxShadow(
                                                        offset: Offset(0, 12),
                                                        color: Color.fromARGB(
                                                            148, 0, 0, 0),
                                                        blurRadius: 16),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "${lsoption[index]}",
                                                    style: Vfont.sonsieOne
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      })),
                                )
                              ],
                            ),
                          ),
                        );
                      } else {
                        _timer!.cancel();

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }
                    return Center(
                        child: Container(child: CircularProgressIndicator()));
                  },
                )),
            //!: Bottom
            Container(
              height: size.height * .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //!: 50/50
                  GestureDetector(
                    onTap: () {
                      if (heart > 2) {
                        heart -= 2;
                        UpdateHeart();

                        setState(() {});
                        showDialog(
                            context: context,
                            builder: ((context) {
                              List<String> data = [
                                lsoption[0].toString(),
                                lsoption[2].toString(),
                                lsoption[3].toString(),
                                lsoption[1].toString(),
                              ];
                              int a = Random().nextInt(4);
                              int b = Random().nextInt(4);
                              if (b == a) {
                                b = 4 - a;
                                if (b < 0) {
                                  b++;
                                } else if (b > 3) {
                                  b--;
                                }
                              }
                              return AlertDialog(
                                title: Text("Gợi ý"),
                                content: Text("${data[a]}\n${data[b]}"),
                              );
                            }));
                      }
                    },
                    child: Container(
                      height: 80,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 123, 72, 225),
                            Color.fromARGB(133, 141, 108, 194)
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
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "50/50\n-2❤️",
                          style: Vfont.sonsieOne.copyWith(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  //!: +15s
                  GestureDetector(
                    onTap: () => them15s(),
                    child: Container(
                      height: 80,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 225, 72, 161),
                            Color.fromARGB(133, 180, 108, 194)
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
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "+15s\n-2❤️",
                          style: Vfont.sonsieOne.copyWith(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  //!: Next question
                  GestureDetector(
                    onTap: () {
                      isLoad = false;
                      next();
                      lsoption = [];
                    },
                    child: Container(
                      height: 80,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
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
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Đổi câu\n-3❤️",
                          style: Vfont.sonsieOne.copyWith(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
