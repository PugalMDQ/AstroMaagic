import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../Api_Connect/ApiConnect.dart';
import '../../Provider/MenuDataProvider.dart';
import '../../ResponseModel/GetUserServiceResponse.dart';
import '../../Utils/AppPreference.dart';

class ServiceHistoryController extends GetxController {
  late MenuDataProvider userDataProvider;
  ApiConnect _connect = Get.put(ApiConnect());
  RxBool isLoading = RxBool(false);
  RxList<UserServiceData> servicesData = RxList();

  @override
  void onInit() {
    userDataProvider =
        Provider.of<MenuDataProvider>(Get.context!, listen: false);
    getUserServices();
    super.onInit();
  }

  getUserServices() async {
    Map<String, dynamic> payload = {
      'loginUserId': AppPreference().getLoginUserId.toString(),
      'userId': AppPreference().getLoginUserId.toString(),
    };
    isLoading.value = true;
    print("getUserServicesPayload:$payload");
    var response = await _connect.getUserServicesCall(payload);
    debugPrint("getUserServicesResponse: ${response.toJson()}");
    if (!response.error!) {
      servicesData.value = response.data!;
      isLoading.value = false;
    } else {}
  }
}
