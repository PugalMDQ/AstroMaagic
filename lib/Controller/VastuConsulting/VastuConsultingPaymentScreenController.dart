import 'package:astromaagic/Utils/AppPreference.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../Api_Connect/ApiConnect.dart';
import '../../Components/Key.dart';
import '../../Provider/MenuDataProvider.dart';
import '../../Routes/app_routes.dart';

class VastuConsultingPaymentScreenController extends GetxController {
  RxBool consultationVirtualMeeting = RxBool(false);
  RxBool personalizedConsultation = RxBool(false);
  RxBool indianRupeeOnclick = RxBool(false);
  RxBool usRupeeOnclick = RxBool(false);
  RxBool googlePayOnclick = RxBool(false);
  RxBool payamOnclick = RxBool(false);
  RxInt selectedTabIndex = 0.obs;
  late MenuDataProvider userDataProvider;
  ApiConnect _connect = Get.put(ApiConnect());
  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    userDataProvider =
        Provider.of<MenuDataProvider>(Get.context!, listen: false);
    super.onInit();
  }

  List<Keyvalues> listValues = [
    Keyvalues(key: "0", value: "User"),
    Keyvalues(key: "1", value: "Employee"),
    Keyvalues(key: "", value: "Employee"),
  ];

  updateCurrentTabIndex(int index) {
    print("INDEX$index");
    selectedTabIndex.value = index;
    listValues[selectedTabIndex.value].key;
    update();
  }

  addUser() async {
    Map<String, dynamic> payload = {
      'loginUserId': AppPreference().getLoginUserId.toString(),
      'userId': AppPreference().getLoginUserId.toString(),
      'serviceId':
          userDataProvider.getAllServicesData!.serviceId.toString() ?? '',
      'remedyId': userDataProvider.getRemediesData!.remedyId.toString(),
      'remedyChargeId':
          userDataProvider.getVastuData!.remedyChargeId.toString() ?? "",
      'paymentStatus': '1',
    };
    isLoading.value = true;
    print("addUserPayload:$payload");
    var response = await _connect.addUserCall(payload);
    debugPrint("addUserResponse: ${response.toJson()}");
    if (!response.error!) {
      Get.toNamed(AppRoutes.serviceHistory.toName);
      // getParticularData = response.data;
      isLoading.value = false;
    } else {}
  }
}
