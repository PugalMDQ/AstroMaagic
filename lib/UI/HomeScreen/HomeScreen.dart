import 'package:astromaagic/Components/theme.dart';
import 'package:astromaagic/Routes/app_routes.dart';
import 'package:astromaagic/Utils/AppPreference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Components/forms.dart';
import '../../Controller/HomeController/HomeScreenController.dart';
import '../../Provider/MenuDataProvider.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    HomeScreenController controller =
    Get.put(HomeScreenController());
    controller.context = context;
    controller.userDataProvider =
        Provider.of<MenuDataProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getAllServices();
      controller.userDataProvider.setIsFromZoomMeeting(false);
    });

    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: AppTheme.App_color,
        image: DecorationImage(
          image: AssetImage(
            "assets/images/backgroundImage.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: AppTheme.App_color,
          appBar: AppBar(
              elevation: 0,
              backgroundColor: AppTheme.App_color,
              leadingWidth: 250,
              leading: Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "      Welcome ${AppPreference().getUserName}",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(
                      color: AppTheme.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              // actions: [
              //   IconButton(
              //       icon: const ImageIcon(
              //           AssetImage("assets/icons/statusIcon.png")),
              //       iconSize: 28,
              //       color: Colors.white,
              //       onPressed: () {
              //         Get.toNamed(AppRoutes.serviceHistory.toName);
              //       })
              // ]




          ),
          body: Container(
            height: height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/backgroundImage.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Obx(
              () => controller.isLoading.value
                  ?  Container()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 22, top: 0, bottom: 10),
                            child: Container(
                              child: Column(
                                children: [
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 1,
                                mainAxisExtent: 200,
                                childAspectRatio: 1.25,
                              ),
                              itemCount: controller.getServicesData.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      width: MediaQuery.of(context).size.width *
                                          0.42,
                                      decoration: BoxDecoration(
                                        color: AppTheme.primaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            controller
                                                .getServicesData[index].services
                                                .toString()
                                                .tr,
                                            style: GoogleFonts.lato(
                                              color: AppTheme.appBlack,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          // Image.asset(
                                          //   "assets/images/logo.png",
                                          //   height: 40,
                                          //   color: Colors.black,
                                          // ),
                                          AppButton2(
                                            width: width * 0.3,
                                            height: 50,
                                            title: "view".tr,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            onPressed: () {
                                              controller.userDataProvider
                                                  .setAllServicesData(controller
                                                      .getServicesData[index]);

                                              Get.toNamed(AppRoutes
                                                  .vastuConsulting.toName);

                                              // if (controller.getServicesData[index]
                                              //         .services ==
                                              //     '') {
                                              //   Get.offNamed(AppRoutes
                                              //       .generalPredictionScreenOne
                                              //       .toName);
                                              //
                                              // } else if (controller
                                              //         .getServicesData[index]
                                              //         .services ==
                                              //     'Vastu Consulting') {
                                              //
                                              // }
                                            },
                                            titleColor:
                                                AppTheme.containerBackground,
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
                    ),
            ),
          )

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
          ),
    );
  }
}
