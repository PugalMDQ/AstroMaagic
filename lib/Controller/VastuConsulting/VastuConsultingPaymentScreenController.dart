import 'package:get/get.dart';

import '../../Components/Key.dart';

class VastuConsultingPaymentScreenController extends GetxController {
  RxBool consultationVirtualMeeting = RxBool(false);
  RxBool personalizedConsultation = RxBool(false);
  RxBool indianRupeeOnclick = RxBool(false);
  RxBool usRupeeOnclick = RxBool(false);
  RxBool googlePayOnclick = RxBool(false);
  RxBool payamOnclick = RxBool(false);
  RxInt selectedTabIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }
  List<Keyvalues> listValues = [
    Keyvalues(key: "0", value: "User"),
    Keyvalues(key: "1", value: "Employee"),  Keyvalues(key: "", value: "Employee"),
  ];

  updateCurrentTabIndex(int index) {
    print("INDEX$index");
    selectedTabIndex.value = index;
    listValues[selectedTabIndex.value].key;
    update();
  }
}
