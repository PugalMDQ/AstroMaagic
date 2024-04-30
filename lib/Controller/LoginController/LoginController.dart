import 'package:astromaagic/Utils/AppPreference.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../Api_Connect/ApiConnect.dart';
import '../../Provider/MenuDataProvider.dart';
import '../../Routes/app_routes.dart';
import '../../Utils/BottomNavBarScreen.dart';

class LoginController extends GetxController {
  RxBool isLoading = RxBool(false);
  TextEditingController mobileController = TextEditingController(text: "7558188330");
  TextEditingController passwordController = TextEditingController(text: "sanjai");
  final ApiConnect _connect = Get.put(ApiConnect());
  late MenuDataProvider userDataProvider;

  @override
  void onInit() {
    super.onInit();
  }

  loginCall(context) async {
    if (mobileController.value.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please Enter Mobile Number",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (passwordController.value.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please Enter Password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }

    Map<String, dynamic> payload = {
      'userMobile':mobileController.text,
      'userPassword':passwordController.text,
    };

    isLoading.value = true;
    var response = await _connect.login(payload);
    isLoading.value = false;

    debugPrint("loginCallResponse: ${response.toJson()}");
    if (!response.error!) {
      Fluttertoast.showToast(
        msg: response.message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );

      AppPreference().updateMobileNumber(mobileController.text);
      AppPreference().updateLang(response.data!.userLanguage ?? "");
      AppPreference().updateCountry(response.data!.userCountry ?? "");
      AppPreference().updateUserName(response.data!.userName ?? "");
      AppPreference().updateLoginUserId(response.data!.userId.toString() ?? "");
      AppPreference().updateToken("Bearer ${response.data!.bearerToken!}");

      Get.offAllNamed(AppRoutes.homeScreen.toName);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => BottomNavBar()),
            (route) => false,
      );
    }
    else {
      Fluttertoast.showToast(
        msg: response.message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  void forgot() {

    userDataProvider.setIsFromForgotOrRegister("Forgot");
    Get.toNamed(AppRoutes.mobileNumberScreen.toName);

  }
}
