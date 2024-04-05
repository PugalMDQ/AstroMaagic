import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/OTPInput.dart';
import '../../Components/forms.dart';
import '../../Components/theme.dart';
import '../../Controller/LoginController/OTPScreenController.dart';
import '../../Routes/app_routes.dart';

class OTPScreen extends GetView<OTPScreenController> {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    OTPScreenController controller = Get.put(OTPScreenController());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/splash.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.offNamed(AppRoutes.register.toName);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 20,
                    ))
              ],
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Card(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: AppTheme.white,
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2, // spread radius
                              blurRadius: 20, // blur radius
                              offset: Offset(0, 3), // shadow color
                            )
                          ]),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "OTP",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            color: AppTheme.white,
                            width: width * 0.75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OtpInput(
                                  controller: controller.fieldOne,
                                  autoFocus: false,
                                ), // auto focus
                                OtpInput(
                                    controller: controller.fieldTwo,
                                    autoFocus: false),
                                OtpInput(
                                    controller: controller.fieldThree,
                                    autoFocus: false),
                                OtpInput(
                                    controller: controller.fieldFour,
                                    autoFocus: false,
                                    isNextFocus: false)
                              ],
                            ),
                          ),
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  child: Text(
                                    controller.showResendOTP.value
                                        ? "Re-Send Code"
                                        : "Re-Send Code: ${controller.otpTimerSeconds.value.toString().padLeft(2, '0')} sec",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  onPressed: controller.showResendOTP.value
                                      ? () {}
                                      : null, // Disable button when countdown is active
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Button(
                                    widthFactor: 0.78,
                                    heightFactor: 0.06,
                                    onPressed: () {
                                      Get.offNamed(AppRoutes.otp.toName);
                                    },
                                    child: Text("SEND",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
