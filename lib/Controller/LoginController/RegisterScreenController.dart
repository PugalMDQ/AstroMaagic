import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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

  @override
  void onInit() {
    super.onInit();
  }
}
