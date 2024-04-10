import 'package:astromaagic/Routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Components/forms.dart';
import '../../Components/theme.dart';
import '../../Controller/LoginController/LoginScreenController.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    LoginScreenController controller = Get.put(LoginScreenController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.App_color,
        body: Container(
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
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 10),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ))
                  ],
                ),
              ),
              Container(
                child: Image.asset(
                  "assets/images/otpImage.png",
                  width: width * 0.8,
                  height: height * 0.2,
                  // color: Colors.white,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width,
                      padding: const EdgeInsets.only(left: 30),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            color: AppTheme.screenBackground,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: AppTheme.primaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  width: 2, color: AppTheme.primaryColor),
                            ),
                            hintText: "Enter your mobile number".tr,
                            hintStyle: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                            contentPadding: const EdgeInsets.only(left: 20),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: AppTheme.primaryColor),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              decorationThickness: 0,
                              color: AppTheme.containerBackground,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  margin: const EdgeInsets.only(left: 18),
                  child: Button(
                      widthFactor: 0.87,
                      heightFactor: 0.06,
                      onPressed: () {
                        // Get.to(OTPScreen());
                        Get.offNamed(AppRoutes.otp.toName);
                      },
                      child: Text("Get OTP".tr,
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
      ),
    );
  }
}
