import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Components/forms.dart';
import '../../Components/theme.dart';
import '../../Controller/LoginController/LoginController.dart';
import '../../Provider/MenuDataProvider.dart';
import '../../Routes/app_routes.dart';
import '../LanguageScreen/LanguageScreen.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    LoginController controller = Get.put(LoginController());
   controller. userDataProvider =
        Provider.of<MenuDataProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: AppTheme.App_color,
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/backgrountwo.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height: height*0.2,),
                Container(
                  child: Image.asset(
                    "assets/images/otpImage.png",
                    width: width * 0.8,
                    height: height * 0.2,
                    // color: Colors.white,
                  ),
                ),
                Container(
                  width: width,
                  child: Text(
                    "Welcome",
                    textAlign: TextAlign.center,
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
                  decoration: BoxDecoration(
                      color: AppTheme.screenBackground,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextFormField(
                    controller: controller.mobileController,
                    keyboardType: TextInputType.phone ,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: AppTheme.primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide:
                            BorderSide(width: 2, color: AppTheme.primaryColor),
                      ),
                      hintText: "Enter your mobile number".tr,
                      hintStyle: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                      contentPadding: const EdgeInsets.only(left: 20),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: AppTheme.primaryColor),
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
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppTheme.screenBackground,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextFormField(
                    controller: controller.passwordController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: AppTheme.primaryColor),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide:
                            BorderSide(width: 2, color: AppTheme.primaryColor),
                      ),
                      hintText: "Enter your password",
                      hintStyle: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                      contentPadding: const EdgeInsets.only(left: 20),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: AppTheme.primaryColor),
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
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: width,
                    child:  InkWell(
                      onTap: (){
                        controller.forgot();
                      },
                      child:Text(
                      "Forgot Password?",
                      textAlign: TextAlign.end,style: GoogleFonts.lato(
                      color: AppTheme.containerBackground,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    ),
                  ),
                ),

                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  child: Obx(() =>  Button(
                      widthFactor: 0.91,
                      heightFactor: 0.06,
                      onPressed: () {
                        if(controller.isLoading.value){
                          return;
                        }
                      controller.loginCall(context);
                      },
                      child:
                      controller.isLoading.value
                          ? Container(
                          height: height * 0.04,
                          width: height * 0.04,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ))
                          :

                      Text("Login".tr,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ))),
                ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: AppTheme.containerBackground,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Get.off(() => LanguageScreen(), transition: Transition.rightToLeft);
                        },
                        child: Text(
                          "Register",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            color: AppTheme.containerBackground,
                            fontSize: 14,
                            textStyle: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: AppTheme.primaryColor),
                            fontWeight: FontWeight.w800,
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
      ),
    );
  }

}
