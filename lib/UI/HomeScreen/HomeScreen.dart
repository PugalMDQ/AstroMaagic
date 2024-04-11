import 'package:astromaagic/Components/theme.dart';
import 'package:astromaagic/Routes/app_routes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Components/HorizontalScrollView.dart';
import '../../Components/forms.dart';
import '../../Controller/HomeController/HomeScreenController.dart';
import '../../Utils/BottomNavBarScreen.dart';
import '../GeneralPredictions/GeneralPredictionScreenOne.dart';
import '../LanguageScreen/LanguageScreen.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    HomeScreenController controller = Get.put(HomeScreenController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 55,
        backgroundColor: AppTheme.screenBackground,
        leading: GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.otp.toName);
          },
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text(
          "".tr,
          style: TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[],
        centerTitle: true,
      ),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/backgroundImage.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 22, top: 0, bottom: 10),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'welcome'.tr,
                          maxLines: 1,
                          style: GoogleFonts.lato(
                            color: AppTheme.containerBackground,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'oshiyo'.tr,
                          style: GoogleFonts.lato(
                            color: AppTheme.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'words'.tr,
                                style: GoogleFonts.lato(
                                  color: AppTheme.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
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
            ),
            Container(
              height: MediaQuery.of(context).size.height - 233,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 3,
                  mainAxisExtent: 225,
                  childAspectRatio: 1.25,
                ),
                itemCount: controller.values.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.23,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              controller.values[index].name,
                              style: GoogleFonts.lato(
                                color: AppTheme.appBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Image.asset(
                              "assets/images/logo.png",
                              height: 40,
                              color: Colors.black,
                            ),
                            AppButton2(
                              width: width * 0.3,
                              height: 50,
                              title: "view".tr,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              onPressed: () {
                                if (controller.values[index].name ==
                                    'General Predictions'.tr) {
                                  Get.offNamed(AppRoutes
                                      .generalPredictionScreenOne.toName);
                                  // Navigator.pushAndRemoveUntil(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => BottomNavBar()),
                                  //       (route) => false,
                                  // );
                                } else if (controller.values[index].name ==
                                    'Vastu Consulting'.tr) {
                                  Get.offNamed(
                                      AppRoutes.vastuConsulting.toName);
                                }
                              },
                              titleColor: AppTheme.containerBackground,
                              color: AppTheme.appBlack,
                              borderColor: AppTheme.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ]),
      //bottomNavigationBar: BottomNavBar(),
      // persistentFooterAlignment: AlignmentDirectional.center,
      // persistentFooterButtons: [
      //
      //   Container(
      //     height: height * 0.05 ,
      //     //color: AppTheme.primaryColor,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       IconButton(
      //           onPressed: () {
      //             Get.to(LanguageScreen());
      //           },
      //           icon: Icon(
      //             Icons.menu,
      //             size: 30,
      //           )),
      //       SizedBox(
      //         width: width * 0.1,
      //       ),
      //       IconButton(onPressed: () {}, icon: Icon(Icons.home, size: 30)),
      //       SizedBox(
      //         width: width * 0.1,
      //       ),
      //       IconButton(onPressed: () {}, icon: Icon(Icons.person, size: 30)),
      //       SizedBox(
      //         width: width * 0.1,
      //       ),
      //       IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 30)),
      //     ],
      //   ),),
      //
      // ],
    );
  }
}
