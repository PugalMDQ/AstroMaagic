import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/SplashController/SplashScreenController.dart';
import '../WelcomeScreenUI/WelcomeScreenOne.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future.delayed(Duration(seconds: 6), () {
      Get.off(() => WelcomeScreenOne(), transition: Transition.rightToLeft);
    });
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Image.asset(
                "assets/images/splash.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      )),
    );
  }
}
