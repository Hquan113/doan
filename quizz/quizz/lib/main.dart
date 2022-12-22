import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizz/pref/user_pre.dart';
import 'package:quizz/screen/bxh_screen.dart';
import 'package:quizz/screen/home_screen.dart';
import 'package:quizz/screen/main_screen.dart';
import 'package:quizz/screen/option_screen.dart';
import 'package:quizz/screen/sigin_screen.dart';

import 'screen/hoanthanh_screen.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserPref.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'dangnhap': (_) => const SiginScreen(),
        'linhvuc': (_) => const OptionsScreen(),
        'home': (_) => const HomeScreen(),
        'bxh': (_) => const BXHScreen(),
        'HoanThanh': (_) => const HoanThanh(),

        // 'manchinh': (_) =>  MainScreen(),
      },
      initialRoute: UserPref.getUserId() == null || UserPref.getUserId() == ""
          ? 'dangnhap'
          : 'home',
      theme: ThemeData(fontFamily: "quick"),
    );
  }
}
