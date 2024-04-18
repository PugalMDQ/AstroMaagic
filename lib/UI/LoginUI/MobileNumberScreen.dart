import 'package:astromaagic/Routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../Components/forms.dart';
import '../../Components/theme.dart';
import '../../Controller/LoginController/mobileNumberScreenController.dart';

class MobileNumberScreen extends GetView<mobileNumberScreenController> {
  const MobileNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    mobileNumberScreenController controller =
        Get.put(mobileNumberScreenController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.App_color,
        leading: IconButton(
            icon: const ImageIcon(AssetImage(
              "assets/icons/back_ios.png",
            )),
            color: AppTheme.primaryColor,
            iconSize: 18,
            onPressed: () {
              Get.back();
            }),
      ),
      backgroundColor: AppTheme.App_color,
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/backgrountwo.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              child: Image.asset(
                "assets/images/otpImage.png",
                width: width * 0.8,
                height: height * 0.2,
                // color: Colors.white,
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width,
                    child: Text(
                      "Enter your mobile number".tr,
                      style: GoogleFonts.lato(
                        color: AppTheme.containerBackground,
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Container(
                    width: width * 0.9,
                    height: 70,
                    child: IntlPhoneField(
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          color: AppTheme.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                      controller: controller.mobileController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 20),
                        labelText: 'Mobile',
                        hintText: 'Mobile',
                        hintStyle: TextStyle(
                          color: AppTheme.white,
                        ),
                        labelStyle: TextStyle(
                          color: AppTheme.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(
                              color: AppTheme.primaryColor,
                            )),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(
                              color: AppTheme.primaryColor,
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        counterStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      dropdownIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       color: AppTheme.screenBackground,
                  //       borderRadius: BorderRadius.all(Radius.circular(5))),
                  //   child: TextFormField(
                  //     controller: controller.mobileController,
                  //     keyboardType: TextInputType.number,
                  //     decoration: InputDecoration(
                  //       focusedBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //             width: 2, color: AppTheme.primaryColor),
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.all(Radius.circular(5)),
                  //         borderSide: BorderSide(
                  //             width: 2, color: AppTheme.primaryColor),
                  //       ),
                  //       hintText: "Enter your mobile number".tr,
                  //       hintStyle: const TextStyle(
                  //           fontSize: 16.0,
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.w400),
                  //       contentPadding: const EdgeInsets.only(left: 20),
                  //       border: OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //             width: 2, color: AppTheme.primaryColor),
                  //         borderRadius: BorderRadius.circular(5),
                  //       ),
                  //     ),
                  //     style: TextStyle(
                  //         decoration: TextDecoration.none,
                  //         decorationThickness: 0,
                  //         color: AppTheme.containerBackground,
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.normal),
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              child: Obx(
                () => Button(
                    widthFactor: 0.91,
                    heightFactor: 0.06,
                    onPressed: () {
                      controller.generateOTP();
                    },
                    child: controller.isLoading.value
                        ? Container(
                            height: height * 0.04,
                            width: height * 0.04,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ))
                        : Text("Get OTP".tr,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
