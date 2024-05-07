import 'package:astromaagic/Routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Components/AppTab.dart';
import '../../Components/HorizontalScrollView.dart';
import '../../Components/forms.dart';
import '../../Components/theme.dart';

import '../../Controller/AdminServiceViewConrtroler/AdminServicesListController.dart';
import '../../Provider/MenuDataProvider.dart';

class AdminServicesList extends GetView<AdminServicesListController> {
  const AdminServicesList({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    AdminServicesListController controller =
        Get.put(AdminServicesListController());
    controller.context = context;
    controller.userDataProvider =
        Provider.of<MenuDataProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getUserServices();
    });
    return Scaffold(
      backgroundColor: AppTheme.App_color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.App_color,
        title: const Text(
          'Service Request',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
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
        child: SingleChildScrollView(
            child: Column(children: [
          Row(
            children: [
              Container(
                width: (width / 2) - 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppTheme.primaryColor),
                            borderRadius: BorderRadius.circular(5.5)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            dropdownColor: AppTheme.App_color,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                hintText: controller.statusDropdown.value,
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: AppTheme.white, fontSize: 12)),
                            items: controller.listStatusData.map((material) {
                              return DropdownMenuItem<String>(
                                value: material,
                                child: Text(
                                  material,
                                  style: TextStyle(
                                    color: AppTheme.primaryColor,
                                    fontSize: 12,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              controller.statusDropdown.value = value!;
                            },
                            icon: Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: (width / 2) - 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      onTap: () {
                        DateTime now = DateTime.now();
                        showModalBottomSheet(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 250,
                                child: CupertinoDatePicker(
                                  onDateTimeChanged: (DateTime newTime) {
                                    String date =
                                        "${newTime.year}-${newTime.month.toString().length <= 1 ? "0${newTime.month}" : newTime.month.toString()}-${newTime.day.toString().length <= 1 ? "0${newTime.day}" : newTime.day.toString()}";
                                    controller.fromDateController.text = date;
                                  },
                                  minimumDate: DateTime(
                                      now.year - 104, now.month, now.day),
                                  maximumDate: DateTime.now(),
                                  initialDateTime: DateTime.now(),
                                  use24hFormat: true,
                                  mode: CupertinoDatePickerMode.date,
                                ),
                              );
                            });
                      },
                      readOnly: true,
                      controller: controller.fromDateController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.5),
                          borderSide: BorderSide(color: AppTheme.primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.5),
                          borderSide: BorderSide(color: AppTheme.primaryColor),
                        ),
                        hintText: 'From Date',
                        hintStyle: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                        contentPadding: const EdgeInsets.all(6),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.primaryColor),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                      ),
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          decorationThickness: 0,
                          color: AppTheme.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Container(
                width: (width / 2) - 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      onTap: () {
                        DateTime now = DateTime.now();
                        showModalBottomSheet(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 250,
                                child: CupertinoDatePicker(
                                  onDateTimeChanged: (DateTime newTime) {
                                    String date =
                                        "${newTime.year}-${newTime.month.toString().length <= 1 ? "0${newTime.month}" : newTime.month.toString()}-${newTime.day.toString().length <= 1 ? "0${newTime.day}" : newTime.day.toString()}";
                                    controller.toDateController.text = date;
                                  },
                                  minimumDate: DateTime(
                                      now.year - 104, now.month, now.day),
                                  maximumDate: DateTime(now.year, now.month,
                                      now.day, now.hour + 1),
                                  initialDateTime: DateTime.now(),
                                  use24hFormat: true,
                                  mode: CupertinoDatePickerMode.date,
                                ),
                              );
                            });
                      },
                      readOnly: true,
                      controller: controller.toDateController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.5),
                          borderSide: BorderSide(color: AppTheme.primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.5),
                          borderSide: BorderSide(color: AppTheme.primaryColor),
                        ),
                        hintText: 'To Date',
                        hintStyle: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                        contentPadding: const EdgeInsets.all(6),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.primaryColor),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                      ),
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          decorationThickness: 0,
                          color: AppTheme.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: (width / 2) - 28,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppTheme.primaryColor),
                            borderRadius: BorderRadius.circular(5.5)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            dropdownColor: AppTheme.App_color,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                hintText: controller.statusDropdown.value,
                                border: InputBorder.none,
                                hintStyle: const TextStyle(
                                    color: AppTheme.white, fontSize: 12)),
                            items: controller.listServicesData.map((material) {
                              return DropdownMenuItem<String>(
                                value: material,
                                child: Text(
                                  material,
                                  style: const TextStyle(
                                    color: AppTheme.primaryColor,
                                    fontSize: 10,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              controller.statusDropdown.value = value!;
                            },
                            icon: const Padding(
                              padding: EdgeInsets.only(right: 0),
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ButtonWithoutBackground(
                  widthFactor: 0.3,
                  heightFactor: 0.055,
                  onPressed: () {
                    controller.toDateController = TextEditingController();
                    controller.fromDateController = TextEditingController();
                    controller.servicesDropdown = RxString('Services');
                    controller.statusDropdown = RxString('Status');
                    controller.getUserServices();
                  },
                  child: Text("Clear",
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w700,
                      ))),
              Button(
                  widthFactor: 0.3,
                  heightFactor: 0.055,
                  onPressed: () {
                    controller.getUserServices();
                  },
                  child: Text("Apply",
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        color: AppTheme.white,
                        fontWeight: FontWeight.w700,
                      ))),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Obx(
            () => HorizontalScrollView(
              children: List.generate(
                controller.filterValues.length,
                (index) {
                  var model = controller.filterValues[index];
                  return AppTab(
                      title: model.value,
                      isSelected: controller.selectedTabIndex.value == index,
                      onClick: () {
                        controller.selectedTabIndex.value = index;
                      });
                },
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Obx(
            () => controller.isLoading.value
                ? Container()
                : ListView.builder(
                    itemCount: controller.servicesData.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return servicesList(context, index);
                    },
                  ),
          ),
        ])),
      ),
    );
  }

  Widget servicesList(BuildContext context, int index) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    AdminServicesListController controller =
        Get.put(AdminServicesListController());
    var setValues = controller.servicesData[index];

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            controller.userDataProvider
                .setUserServiceData(controller.servicesData[index]);
            Get.offAllNamed(AppRoutes.adminServicesViewScreen.toName);
          },
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            width: width,
            height: height * 0.15,
            decoration: BoxDecoration(
              color: AppTheme.screenBackground,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppTheme.primaryColor, width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10, left: 20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppTheme.screenBackground,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage("assets/images/Ellipse 69.png"),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: width * 0.43,
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 18),
                          Container(
                            width: width * 0.7,
                            child: Text(
                              setValues.userName.toString() ?? "",
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.7,
                            child: Text(
                              setValues.services.toString() ?? "",
                              style: GoogleFonts.lato(
                                color: AppTheme.primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.8,
                            child: Text(
                              setValues.remedy.toString() ?? "",
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 45),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              setValues.createdDateTime.toString() ?? "",
                              maxLines: 1,
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        setValues.serviceStatus.toString() ?? "",
                        maxLines: 1,
                        style: GoogleFonts.lato(
                          color: AppTheme.primaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.only(bottom: 0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       AppButton2(
                //         width: width * 0.2,
                //         height: 20,
                //         title: "view".tr,
                //         fontSize: 10,
                //         fontWeight: FontWeight.w600,
                //         onPressed: () {
                //           controller.userDataProvider
                //               .setUserServiceData(controller.servicesData[index]);
                //           Get.offAllNamed(
                //               AppRoutes.adminServicesViewScreen.toName);
                //         },
                //         titleColor: AppTheme.primaryColor,
                //         color: AppTheme.appBlack,
                //         borderColor: AppTheme.primaryColor,
                //       ),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       controller.servicesData[index].serviceStatus.toString() ==
                //               "Pending"
                //           ? AppButtonSmall(
                //               width: width * 0.21,
                //               height: 20,
                //               title: "Accept",
                //               fontSize: 10,
                //               fontWeight: FontWeight.w600,
                //               onPressed: () {
                //                 controller.userDataProvider.setUserServiceData(
                //                     controller.servicesData[index]);
                //                 controller.acceptService();
                //               },
                //               titleColor: AppTheme.appBlack,
                //               color: AppTheme.appBlack,
                //               borderColor: AppTheme.primaryColor,
                //             )
                //           : Container(),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
