import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LanguageScreenController extends GetxController {
  RxInt selectedTabIndex = RxInt(0);
  RxBool tamilOnclick = RxBool(false);
  RxBool englishOnclick = RxBool(false);
  RxBool hindiOnclick = RxBool(false);
  TextEditingController countryController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  updateCurrentTabIndex(int index) {
    print("INDEX$index");
    selectedTabIndex.value = index;
    // listValues[selectedTabIndex.value].key;
    update();
  }
}
