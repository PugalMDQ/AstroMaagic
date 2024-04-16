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

class HomeScreenController extends GetxController {
  final CarouselController controllerOne = CarouselController();
  late MenuDataProvider userDataProvider;
  RxInt currentIndex = RxInt(0);
  RxInt current = RxInt(0);
  ApiConnect _connect = Get.put(ApiConnect());
  RxBool isLoading = RxBool(false);
  RxList<GetAllServicesData> getServicesData = RxList();

  void updatePageIndicator(index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    userDataProvider =
        Provider.of<MenuDataProvider>(Get.context!, listen: false);
    getAllServices();
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
    print("getServicesPayload:$payload");
    var response = await _connect.getAllServicesCall(payload);
    debugPrint("getAllServicesResponse: ${response.toJson()}");
    isLoading.value = false;
    if (!response.error!) {
      getServicesData.value = response.data!;

    } else {}
  }
}
