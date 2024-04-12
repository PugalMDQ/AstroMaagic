import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Components/forms.dart';
import '../../Components/theme.dart';
import '../../Controller/CountrySelectionController/CountrySelectionController.dart';
import '../../Controller/LanguageScreenController/LanguageScreenController.dart';
import '../../Utils/BottomNavBarScreen.dart';
import '../LoginUI/RegisterScreen.dart';

class CountrySelectionScreen extends GetView<CountrySelectionScreenController> {
  CountrySelectionScreen({super.key});



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
                        "assets/images/country.png",
                        fit: BoxFit.contain,
                        width: width * 0.8,
                        height: height * 0.3,
                      ),

                      Container(
                        width: width,
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          "Choose Your Country".tr,
                          style: GoogleFonts.lato(
                            color: AppTheme.containerBackground,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                     Row(
                       children: [
                         Container(
                         width: width / 2 - 25,
                         margin: EdgeInsets.fromLTRB(12, 14, 12, 0),
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(15)

                         ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Container(
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(15)

                               ),
                               child: TextFormField(
                                 readOnly: true,
                                 obscureText: true,

                                   style: TextStyle(

                                       letterSpacing: 0.2,
                                       color: AppTheme.textColor,
                                       fontWeight: FontWeight.w400,
                                       fontSize: 14),
                                   controller: controller.countryController,
                                   decoration: InputDecoration(
                                     fillColor: AppTheme.containerBackground,
                                     filled: true,
                                     contentPadding: EdgeInsets.only(
                                        left: 60,right: 30
                                     ),

                                     hintText: "India",
                                     hintStyle: TextStyle(
                                       color: AppTheme.textColor,
                                       fontSize: 20
                                     ),

                                     enabledBorder: OutlineInputBorder(
                                       //borderRadius: BorderRadius.circular(5.5),
                                       borderSide: BorderSide( color: Color(0x4d252525),width: 1.0),
                                     ),
                                     focusedBorder: OutlineInputBorder(
                                       // borderRadius: BorderRadius.circular(5.5),
                                       borderSide:  BorderSide(
                                           color: Color(0x4d252525), width: 1.0),
                                     ),



                                   )
                               ),
                             )
                           ],
                         ),
                       ),
                         Container(
                           width: width / 2 - 25,
                           margin: EdgeInsets.fromLTRB(12, 14, 12, 0),
                           decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(15)

                           ),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Container(
                                 decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius: BorderRadius.circular(15)

                                 ),
                                 child: TextFormField(
                                     style: TextStyle(
                                         letterSpacing: 0.2,
                                         color: AppTheme.textColor,
                                         fontWeight: FontWeight.w400,
                                         fontSize: 14),
                                     controller: controller.countryController,
                                     decoration: InputDecoration(
                                       fillColor: AppTheme.containerBackground,
                                       filled: true,
                                       contentPadding: EdgeInsets.only(
                                          left: 60,

                                       ),
                                       // label: Text('Remarks'),
                                       // labelStyle: TextStyle(
                                       //     color:  AppTheme.labelColor,
                                       //     fontSize: 12,
                                       //     fontWeight: FontWeight.w500),

                                       hintText: "Other ",
                                       hintStyle: TextStyle(
                                         fontSize: 20,
                                         color: AppTheme.textColor,

                                       ),
                                       enabledBorder: OutlineInputBorder(
                                         //borderRadius: BorderRadius.circular(5.5),
                                         borderSide: BorderSide( color: Color(0x4d252525),width: 1.0),
                                       ),
                                       focusedBorder: OutlineInputBorder(
                                         // borderRadius: BorderRadius.circular(5.5),
                                         borderSide:  BorderSide(
                                             color: Color(0x4d252525), width: 1.0),
                                       ),



                                     )
                                 ),
                               )
                             ],
                           ),
                         ),],
                     )

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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegisterScreen()));

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
