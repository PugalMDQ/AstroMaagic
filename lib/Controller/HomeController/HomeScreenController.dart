import 'package:astromaagic/Utils/AppPreference.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../Api_Connect/ApiConnect.dart';
import '../../Components/HomeListDetails.dart';
import '../../Provider/MenuDataProvider.dart';
import '../../ResponseModel/GetAllServicesResponse.dart';
import '../../Utils/app_utility.dart';

class HomeScreenController extends GetxController {
  final CarouselController controllerOne = CarouselController();
  late MenuDataProvider userDataProvider;
  RxInt currentIndex = RxInt(0);
  RxInt current = RxInt(0);
  ApiConnect _connect = Get.put(ApiConnect());
  RxBool isLoading = RxBool(false);
  RxList<GetAllServicesData> getServicesData = RxList();
  late BuildContext context;
  void updatePageIndicator(index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  final List<HomeListDetails> values = [
    HomeListDetails(
      name: 'Personalized Horoscope'.tr,
    ),
    HomeListDetails(
      name: 'Vastu Consulting'.tr,
    ),
    HomeListDetails(
      name: 'Numerology'.tr,
    ),
    HomeListDetails(
      name: 'Gemmology'.tr,
    ),
    HomeListDetails(
      name: 'Gemmology'.tr,
    ),
  ];

  getAllServices() async {
    Map<String, dynamic> payload = {
      'loginUserId': AppPreference().getLoginUserId.toString()
    };
    isLoading.value = true;
    AppUtility.loader(context);
    print("getServicesPayload:$payload");
    var response = await _connect.getAllServicesCall(payload);
    debugPrint("getAllServicesResponse: ${response.toJson()}");
    Get.back();
    isLoading.value = false;
    if (!response.error!) {
      getServicesData.value = response.data!;

    } else {}
  }
}
