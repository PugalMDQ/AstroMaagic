import 'package:astromaagic/Controller/WelcomeScreenController/WelcomeScreenTwoControlller.dart';
import 'package:astromaagic/UI/WelcomeScreenUI/WelcomeScreenThree.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreenTwo extends GetView<WelcomeScreenTwoController> {
  const WelcomeScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future.delayed(Duration(seconds: 4), () {
      Get.off(() => WelcomeScreenThree(), transition: Transition.rightToLeft);
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
                "assets/images/splashTwo.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.23,
              ),
              Center(
                child: Image.asset(
                  "assets/images/horoscope.png",
                  fit: BoxFit.contain,
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
