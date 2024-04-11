import 'package:astromaagic/Routes/app_routes.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../Components/DateRangeExample.dart';
import '../../Components/OTPInput.dart';
import '../../Components/forms.dart';
import '../../Components/theme.dart';
import '../../Controller/LoginController/RegisterScreenController.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends GetView<RegisterScreenController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    RegisterScreenController controller = Get.put(RegisterScreenController());
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/backgrountwo.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 20,
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.12,
                          ),
                          Image.asset(
                            "assets/images/dotline.png",
                            fit: BoxFit.contain,
                            height: 40,
                          ),
                        ],
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.09,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Text(
                              "Let\'s get your personalized astro".tr,
                              overflow: TextOverflow.fade,
                              style: const TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'account'.tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: width * 0.2,
                            height: 32,
                            color: AppTheme.primaryColor,
                            child: Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                'set up'.tr,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'quickly and'.tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "easily!".tr,
                            style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: TextInput(
                      //       obscureText: true,
                      //       height: 100,
                      //       // controller: controller.gstNumberController,
                      //       label: '',
                      //       onPressed: () {},
                      //       onTextChange: (text) {},
                      //       textInputType: TextInputType.text,
                      //       textColor: Color(0xCC252525),
                      //       hintText: 'Name',
                      //       prefixIcon: Icon(Icons.account_circle_rounded)),
                      // ),
                      // TextInput(
                      //     obscureText: true,
                      //     height: 100,
                      //     // controller: controller.gstNumberController,
                      //     label: '',
                      //     onPressed: () {},
                      //     onTextChange: (text) {},
                      //     textInputType: TextInputType.text,
                      //     textColor: Color(0xCC252525),
                      //     hintText: 'Name',
                      //     prefixIcon: Icon(Icons.account_circle_rounded)),
                      // TextInput(
                      //     obscureText: true,
                      //     height: 100,
                      //     // controller: controller.gstNumberController,
                      //     label: '',
                      //     onPressed: () {},
                      //     onTextChange: (text) {},
                      //     textInputType: TextInputType.text,
                      //     textColor: Color(0xCC252525),
                      //     hintText: 'Name',
                      //     prefixIcon: Icon(Icons.account_circle_rounded)),
                      // TextInput(
                      //     obscureText: true,
                      //     height: 100,
                      //     controller: controller.dateAndTimeController,
                      //     label: '',
                      //     onPressed: () {
                      //       _showBottomSheetDate(
                      //           context,
                      //           controller.dateAndTimeController,
                      //           controller.selectedDate,
                      //           controller.dateformat);
                      //     },
                      //     onTextChange: (text) {},
                      //     textInputType: TextInputType.text,
                      //     textColor: Color(0xCC252525),
                      //     hintText: 'Date',
                      //     isReadOnly: true,
                      //     prefixIcon: Icon(Icons.account_circle_rounded)),
                      // TextInput(
                      //     obscureText: true,
                      //     height: 100,
                      //     isReadOnly: true,
                      //     controller: controller.timeOfBirthController,
                      //     label: '',
                      //     onPressed: () {
                      //       showBottomTimePicker(
                      //           context, controller.timeOfBirthController);
                      //     },
                      //     onTextChange: (text) {},
                      //     textInputType: TextInputType.text,
                      //     textColor: Color(0xCC252525),
                      //     hintText: 'Name',
                      //     prefixIcon: Icon(Icons.account_circle_rounded)),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppTheme.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: AppTheme.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: AppTheme.white),
                                ),
                                hintText: 'Full Name'.tr,
                                hintStyle: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                                contentPadding: const EdgeInsets.all(6),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppTheme.white),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                prefixIcon: Icon(Icons.person)),
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                decorationThickness: 0,
                                color: AppTheme.textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppTheme.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: TextFormField(
                            onTap: () {
                              _showBottomSheetDate(
                                  context,
                                  controller.dateOfBirthController,
                                  controller.selectedDate,
                                  controller.dateformat);
                            },
                            readOnly: true,
                            controller: controller.dateOfBirthController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: AppTheme.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: AppTheme.white),
                                ),
                                hintText: 'Date of Birth'.tr,
                                hintStyle: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                                contentPadding: const EdgeInsets.all(6),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppTheme.white),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                prefixIcon: Icon(Icons.calendar_month)),
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                decorationThickness: 0,
                                color: AppTheme.textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppTheme.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: AppTheme.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: AppTheme.white),
                                ),
                                hintText: 'Place of Birth'.tr,
                                hintStyle: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                                contentPadding: const EdgeInsets.all(6),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppTheme.white),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                prefixIcon: Icon(Icons.location_on_rounded)),
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                decorationThickness: 0,
                                color: AppTheme.textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppTheme.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: TextFormField(
                              onTap: () {
                                showBottomTimePicker(
                                    context, controller.timeOfBirthController);
                              },
                              keyboardType: TextInputType.number,
                              readOnly: true,
                              controller: controller.timeOfBirthController,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: AppTheme.white),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: AppTheme.white),
                                  ),
                                  hintText: 'Time of Birth'.tr,
                                  hintStyle: const TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                  contentPadding: const EdgeInsets.all(6),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppTheme.white),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  prefixIcon:
                                      Icon(Icons.access_time_filled_outlined)),
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  decorationThickness: 0,
                                  color: AppTheme.textColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
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
                                  controller.married.value =
                                      !controller.married.value;
                                  controller.unMarried.value = false;
                                },
                                child: Container(
                                  width: width * 0.4,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: controller.married.value
                                        ? AppTheme.primaryColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: controller.married.value
                                          ? AppTheme.primaryColor
                                          : Colors.white,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Married".tr,
                                      style: TextStyle(
                                        color: controller.married.value
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 30,
                          ),
                          Obx(() => GestureDetector(
                                onTap: () {
                                  controller.unMarried.value =
                                      !controller.unMarried.value;
                                  controller.married.value = false;
                                  ;
                                },
                                child: Container(
                                  width: width * 0.4,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: controller.unMarried.value
                                        ? AppTheme.primaryColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: controller.unMarried.value
                                          ? AppTheme.primaryColor
                                          : Colors.white,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Unmarried".tr,
                                      style: TextStyle(
                                        color: controller.unMarried.value
                                            ? Colors.white
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
                        height: height * 0.18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Button(
                                widthFactor: 0.85,
                                heightFactor: 0.06,
                                onPressed: () {
                                  Get.toNamed(AppRoutes.login.toName);

                                  // if (controller.married.value == true ||
                                  //     controller.unMarried.value == true) {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               RegisterScreen()));
                                  // } else {
                                  //   Fluttertoast.showToast(
                                  //     msg: "Please Select Marriage Status!!",
                                  //     toastLength: Toast.LENGTH_SHORT,
                                  //     gravity: ToastGravity.BOTTOM,
                                  //     backgroundColor: Colors.black,
                                  //     textColor: Colors.white,
                                  //   );
                                  // }
                                },
                                child: Text("Submit".tr,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ))),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  showBottomTimePicker(
    BuildContext context,
    TextEditingController controller,
  ) {
    var times;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: 280,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 15, bottom: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(height: 20, width: 20),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text("Select Time",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppTheme.appBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(Icons.clear))
                      ],
                    ),
                  ),
                  Expanded(
                    child: TimePickerSpinner(
                      is24HourMode: false,
                      spacing: 30,
                      itemHeight: 37,
                      itemWidth: 60,
                      isForce2Digits: true,
                      onTimeChange: (time) {
                        times = time;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppButton2(
                        width: width * 0.45,
                        height: 40,
                        title: 'Cancel',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        onPressed: () {
                          Get.back();
                        },
                        color: Colors.white,
                        titleColor: AppTheme.bottomTabsLabelInActiveColor,
                        borderColor: AppTheme.cancelBorder,
                      ),
                      AppButton2(
                        width: width * 0.45,
                        height: 40,
                        title: 'Save ',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        onPressed: () {
                          controller.text = " ${formatDate(times, [
                                hh.trim(),
                                ':',
                                nn.trim(),
                                ':',
                                am.trim()
                              ])}";
                          Navigator.of(context).pop();
                        },
                        titleColor: Colors.black,
                        color: AppTheme.primaryColor,
                        borderColor: AppTheme.primaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showBottomSheetDate(
    BuildContext context,
    TextEditingController controller,
    RxString selectedDate,
    RxString dateformat,
  ) {
    DateTime focusDay = DateTime.now();
    DateTime? selectedDay = focusDay;
    selectedDate.value = formatDate(selectedDay!, [yyyy, '-', mm, '-', dd]);
    dateformat.value = formatDate(selectedDay, [dd, '.', M, '.', yyyy]);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Get.bottomSheet(SingleChildScrollView(
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            child: Container(
                color: Colors.white,
                child: Column(children: [
                  Container(
                    height: 350,
                    child: DateRangeExample(
                        controller: controller,
                        selectedDate: selectedDate,
                        dateformat: dateformat),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppButton2(
                        width: width * 0.45,
                        height: 40,
                        title: 'Cancel',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        onPressed: () {
                          Get.back();
                        },
                        color: Colors.white,
                        titleColor: AppTheme.bottomTabsLabelInActiveColor,
                        borderColor: AppTheme.cancelBorder,
                      ),
                      AppButton2(
                        width: width * 0.45,
                        height: 40,
                        title: 'Save ',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        onPressed: () {
                          controller.text = dateformat.value;
                          Navigator.pop(context);
                          // _showbottomTimePicker(context, controller,
                          //     controller.value.text, dateformat, selectedDate);
                        },
                        titleColor: Colors.black,
                        color: AppTheme.primaryColor,
                        borderColor: AppTheme.primaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ])))));
  }
}
