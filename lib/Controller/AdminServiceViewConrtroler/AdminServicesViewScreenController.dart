import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../Api_Connect/ApiConnect.dart';
import '../../Provider/MenuDataProvider.dart';
import '../../Routes/app_routes.dart';
import '../../Utils/AppPreference.dart';
import '../../Utils/app_utility.dart';

class AdminServicesViewScreenController extends GetxController {
  late MenuDataProvider userDataProvider;
  RxBool isLoading = RxBool(false);
  late BuildContext context;
  ApiConnect _connect = Get.put(ApiConnect());
  List<String> listStatusData = ["Accepted", "In-Progress", "Completed"];
  RxString statusDropdown = RxString('Change Status');

  @override
  void onInit() {
    super.onInit();
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
      Get.offAllNamed(AppRoutes.adminServicesList.toName);
      // getUserServices();
    } else {}
  }
}
