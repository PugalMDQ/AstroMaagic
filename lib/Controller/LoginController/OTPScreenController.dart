import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class OTPScreenController extends GetxController {
  TextEditingController fieldOne = TextEditingController();
  TextEditingController fieldTwo = TextEditingController();
  TextEditingController fieldThree = TextEditingController();
  TextEditingController fieldFour = TextEditingController();
  TextEditingController fieldFive = TextEditingController();
  TextEditingController fieldSix = TextEditingController();
  RxString otp = RxString('');
  RxInt otpTimerSeconds = RxInt(60);
  Timer? _otpTimer;
  RxBool showResendOTP = RxBool(true);

  @override
  void onInit() {
    startOTPTimer();
    super.onInit();
  }

  void startOTPTimer() {
    _otpTimer?.cancel();
    otpTimerSeconds.value = 60;
    showResendOTP.value = false;
    _otpTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (otpTimerSeconds.value > 0) {
        //// Decrement the timer value
        otpTimerSeconds.value--;
      } else {
        _otpTimer?.cancel();
        showResendOTP.value = true;
      }
    });
  }
}
