import 'package:astromaagic/Components/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/WelcomeScreenController/WelcomeScreenOneController.dart';
import 'WelcomeScreenTwo.dart';

class WelcomeScreenOne extends GetView<WelcomeScreenOneController> {
  WelcomeScreenOne({super.key});

  final List local = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'தமிழ்', 'locale': Locale('ta', 'IN')}, // Tamil (India)
    // {'name': 'ಕನ್ನಡ', 'locale': Locale('kn', 'IN')}, // Kannada (India)
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  showLanguage(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: AppTheme.screenColor,
            title: Text(
              'Choose',
              style: TextStyle(
                color: AppTheme.borderLineLightGrey,
              ),
            ),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: local.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print("VALUES:${local[index]['locale']}");
                      updateLanguage(local[index]['locale']);
                    },
                    child: Text(
                      local[index]['name'],
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: AppTheme.screenColor,
                  );
                },
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future.delayed(Duration(seconds: 4), () {
      Get.off(() => WelcomeScreenTwo(), transition: Transition.rightToLeft);
    });

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: GestureDetector(
                onTap: () {
                  showLanguage(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Language'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.language,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
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
                    "assets/images/numerology.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
