import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../../constant/assets.dart';
import '../../../constant/color_manager.dart';
import '../../../main.dart';
import '../../../viewmodel/database/CacheHelper.dart';
import '../authentication/loginScreen.dart';
import '../layouthome/layoutScreen.dart';
import 'onBoard_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var uidTw =CacheHelper.get(key: 'uid');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('${FirebaseAuth.instance.currentUser!.uid}');

  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 5000,
      splashIconSize: double.infinity,
      backgroundColor: Colors.white,
      centered: true,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRight,
      splash: Image.asset("$logoSplashSvg"),
      nextScreen: onBoard
          ? CacheHelper.get(key: 'uid') == FirebaseAuth.instance.currentUser!.uid.toString()
          ? LayoutScreen()
          : LoginScreen()
          : OnBoardScreen(),
    );
    // return Container(
    //   decoration: BoxDecoration(
    //     gradient: LinearGradient(colors: [
    //       Color(0xff69D7C4),
    //       Color(0xff36A693),
    //     ], begin: Alignment.bottomLeft, end: Alignment.topRight)
    //   ),
    //   child: AnimatedSplashScreen(
    //     duration: 5000,
    //     splashIconSize: double.infinity,
    //     backgroundColor: Colors.white,
    //     centered: true,
    //     splashTransition: SplashTransition.fadeTransition,
    //      pageTransitionType: PageTransitionType.leftToRight,
    //     splash: Image.asset("$logoSplashSvg"),
    //     nextScreen: OnBoardScreen(),
    //   ),
    // );
  }
}
