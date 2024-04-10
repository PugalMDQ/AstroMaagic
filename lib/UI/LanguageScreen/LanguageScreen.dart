import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Components/forms.dart';
import '../../Components/theme.dart';
import '../../Controller/LanguageScreenController/LanguageScreenController.dart';
import '../../Utils/BottomNavBarScreen.dart';
import '../LoginUI/RegisterScreen.dart';

class LanguageScreen extends GetView<LanguageScreenController> {
  LanguageScreen({super.key});

  final List localEnglish = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
  ];
  final List localTamil = [
    {'name': 'தமிழ்', 'locale': Locale('ta', 'IN')},
  ];
  final List localKannada = [
    {'name': 'ಕನ್ನಡ', 'locale': Locale('kn', 'IN')},
  ];
  final List localHindi = [
    {'name': 'हिन्दी', 'locale': Locale('hi', 'IN')},
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    LanguageScreenController controller = Get.put(LanguageScreenController());

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(right: 0),
                child: Image.asset(
                  "assets/images/backgrountwo.png",
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/language.png",
                        fit: BoxFit.contain,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Choose Language",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Obx(() => GestureDetector(
                                onTap: () {
                                  controller.tamilOnclick.value =
                                      !controller.tamilOnclick.value;
                                  controller.englishOnclick.value = false;
                                  controller.hindiOnclick.value = false;
                                  print("VALUES:${localTamil[0]['locale']}");
                                  updateLanguage(localTamil[0]['locale']);
                                },
                                child: Container(
                                  width: width * 0.4,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: controller.tamilOnclick.value
                                        ? AppTheme.primaryColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: controller.tamilOnclick.value
                                          ? AppTheme.primaryColor
                                          : Colors.white,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Tamil",
                                      style: TextStyle(
                                        color: controller.tamilOnclick.value
                                            ? Colors.black
                                            : Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Obx(() => GestureDetector(
                                onTap: () {
                                  controller.englishOnclick.value =
                                      !controller.englishOnclick.value;
                                  controller.tamilOnclick.value = false;
                                  controller.hindiOnclick.value = false;
                                  print("VALUES:${localEnglish[0]['locale']}");
                                  updateLanguage(localEnglish[0]['locale']);
                                },
                                child: Container(
                                  width: width * 0.4,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: controller.englishOnclick.value
                                        ? AppTheme.primaryColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: controller.englishOnclick.value
                                          ? AppTheme.primaryColor
                                          : Colors.white,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "English",
                                      style: TextStyle(
                                        color: controller.englishOnclick.value
                                            ? Colors.black
                                            : Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Obx(() => GestureDetector(
                                onTap: () {
                                  controller.hindiOnclick.value =
                                      !controller.hindiOnclick.value;
                                  controller.englishOnclick.value = false;
                                  controller.tamilOnclick.value = false;

                                  print("VALUES:${localHindi[0]['locale']}");
                                  updateLanguage(localHindi[0]['locale']);
                                },
                                child: Container(
                                  width: width * 0.4,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: controller.hindiOnclick.value
                                        ? AppTheme.primaryColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: controller.hindiOnclick.value
                                          ? AppTheme.primaryColor
                                          : Colors.white,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Hindi",
                                      style: TextStyle(
                                        color: controller.hindiOnclick.value
                                            ? Colors.black
                                            : Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Button(
                            widthFactor: 0.85,
                            heightFactor: 0.06,
                            onPressed: () {
                              if (controller.englishOnclick.value == true ||
                                  controller.tamilOnclick.value == true ||
                                  controller.hindiOnclick.value == true) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterScreen()));
                              } else {
                                Fluttertoast.showToast(
                                  msg: "Please Choose Language!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                );
                              }
                            },
                            child: Text("Next".tr,
                                style: GoogleFonts.lato(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ))),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
