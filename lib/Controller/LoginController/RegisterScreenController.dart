import 'package:astromaagic/Utils/AppPreference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../Api_Connect/ApiConnect.dart';
import '../../Utils/BottomNavBarScreen.dart';

class RegisterScreenController extends GetxController {
  RxBool married = RxBool(false);
  RxBool unMarried = RxBool(false);
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  TextEditingController timeOfBirthController = TextEditingController();
  RxString dateformat = RxString("");
  TextEditingController dateAndTimeController = TextEditingController();
  RxString selectedDate = RxString("");
  final ApiConnect _connect = Get.put(ApiConnect());

  @override
  void onInit() {
    super.onInit();
  }

  loginCall(context) async {
    if (fullNameController.value.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please Enter FullName number",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (dateOfBirthController.text.length < 10) {
      Fluttertoast.showToast(
        msg: "Please Enter Valid DOB",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }

    if (placeOfBirthController.value.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please Enter Place Of Birth",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (timeOfBirthController.value.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please Enter Time Of Birth",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }

    Map<String, dynamic> payload = {
    'userName':fullNameController.text,
    'placeOfBirth': placeOfBirthController.text,
    'dateOfBirth':dateOfBirthController.text,
    'timeOfBirth':timeOfBirthController.text,
    'maritalStatus': married.value == true ? "married" : "unMarried",
    'userLanguage': AppPreference().getLanguage,
    'userCountry': AppPreference().getCountry,
    'userMobile':'7550207382',
    'isMobileVerified':1
    };
    print(payload);

    var response = await _connect.login(payload);
    debugPrint("loginCallResponse: ${response.toJson()}");
    if (!response.error!) {
      Fluttertoast.showToast(
        msg: response.message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => BottomNavBar()),
            (route) => false,
      );
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) => BottomNavBar()),
      //       (route) => false,
      // );

    } else {
      Fluttertoast.showToast(
        msg: response.message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }


}
