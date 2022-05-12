import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dominos/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'onbording.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Image.asset("assets/Fast Food_free-file.png"),
        splashIconSize: double.infinity ,
        nextScreen:  OnbordingScreen(),
        splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
        backgroundColor: AppColor.primary,
    );
  }
}
