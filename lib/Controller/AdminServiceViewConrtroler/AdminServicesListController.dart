import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../Api_Connect/ApiConnect.dart';
import '../../Components/Key.dart';
import '../../Provider/MenuDataProvider.dart';
import '../../Utils/AppPreference.dart';
import '../../Utils/app_utility.dart';
import '../../ResponseModel/GetUserServiceResponse.dart';

class AdminServicesListController extends GetxController {
  RxBool isLoading = RxBool(false);
  RxString statusDropdown = RxString('Status');
  late BuildContext context;
  late MenuDataProvider userDataProvider;
  ApiConnect _connect = Get.put(ApiConnect());
  RxList<UserServiceData> servicesData = RxList();
  RxInt selectIndex = RxInt(0);
  RxString servicesDropdown = RxString('Services');
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  List<String> listStatusData = ["Accepted", "In-Progress", "Completed"];
  RxInt selectedTabIndex = RxInt(0);

  List<String> listServicesData = [
    "Vastu Consulting",
    "Personalized Horoscope",
  ];

  List<KeyValues> filterValues = [
    KeyValues(key: "0", value: "Today"),
    KeyValues(key: "1", value: "Yesterday"),
    KeyValues(key: "1", value: "Last week"),
    KeyValues(key: "1", value: "Earlier"),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  getUserServices() async {
    Map<String, dynamic> payload = {
      'loginUserId': AppPreference().getLoginUserId.toString(),
      // 'userId': AppPreference().getLoginUserId.toString(),
    };
    isLoading.value = true;
    AppUtility.loader(context);

    print("getUserServicesPayload:$payload");

    var response = await _connect.getUserServicesCall(payload);
    debugPrint("getUserServicesResponse: ${response.toJson()}");
    Get.back();
    if (!response.error!) {
      servicesData.value = response.data!;
      isLoading.value = false;
    } else {}
  }

  acceptService() async {
    Map<String, dynamic> payload = {
      'loginUserId': AppPreference().getLoginUserId.toString(),
      'userServiceId':
          userDataProvider.getServiceData!.userServiceId.toString(),
    };
    print('acceptServicePayload:$payload');
    isLoading.value = true;
    AppUtility.loader(context);
    var response = await _connect.acceptUserServiceCall(payload);
    debugPrint("acceptServiceResponse: ${response.toJson()}");
    Get.back();
    isLoading.value = false;
    if (!response.error!) {
      Fluttertoast.showToast(
        msg: response.message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      getUserServices();
    } else {}
  }
}
