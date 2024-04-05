import 'package:astromaagic/Components/theme.dart';
import 'package:astromaagic/UI/WelcomeScreenUI/WelcomeScreenTwo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/forms.dart';
import '../../Controller/WelcomeScreenController/WelcomeScreenOneController.dart';

class WelcomeScreenOne extends GetView<WelcomeScreenOneController> {
  const WelcomeScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.screenBackground,
        body: Column(
          children: [
            Container(
              child: const Image(
                image: AssetImage(
                  "assets/images/welecome.png",
                  // Path to the image file
                ),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'KP & VEDIC ASTROLOGY',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'It is a long established fact that a reader will\n be distracted by the readable-at its layout',
                  style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.hintColor,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Center(
                    child: Button(
                        widthFactor: 0.25,
                        heightFactor: 0.05,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const WelcomeScreenTwo()));
                        },
                        child: const Text("NEXT",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
