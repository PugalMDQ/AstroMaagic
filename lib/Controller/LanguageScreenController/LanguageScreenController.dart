import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Components/Key.dart';

class LanguageScreenController extends GetxController {
  RxInt selectedTabIndex = RxInt(0);
  RxBool tamilOnclick = RxBool(false);
  RxBool englishOnclick = RxBool(false);
  RxBool hindiOnclick = RxBool(false);

  final List localEnglish = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
  ];
  final List localTamil = [
    {'name': 'தமிழ்', 'locale': Locale('ta', 'IN')},
  ];
  final List localKannada = [
    {'name': 'ಕನ್ನಡ', 'locale': Locale('kn', 'IN')},
  ];
  final List localHindi = [
    {'name': 'हिन्दी', 'locale': Locale('hi', 'IN')},
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  // final listValues = [
  //   {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
  //   {'name': 'தமிழ்', 'locale': Locale('ta', 'IN')},
  //   {'name': 'ಕನ್ನಡ', 'locale': Locale('kn', 'IN')},
  //   {'name': 'हिन्दी', 'locale': Locale('hi', 'IN')},
  //
  // ];


  @override
  void onInit() {
    super.onInit();
  }
  List<Keyvalues> listValues = [
    Keyvalues(key: "0", value: 'ENGLISH'),
    Keyvalues(key: "1", value: 'தமிழ்'),
    Keyvalues(key: "2", value: 'ಕನ್ನಡ'),
    Keyvalues(key: "3", value: 'हिन्दी'),
  ];


  updateCurrentTabIndex(int index) {
    print("INDEX$index");
    selectedTabIndex.value = index;
     listValues[selectedTabIndex.value].key;
    update();
  }
}
