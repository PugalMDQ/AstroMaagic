import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Api_Connect/ApiConnect.dart';
import '../../ResponseModel/GetAllCountrysResponse.dart';

class CountrySelectionScreenController extends GetxController {
  TextEditingController countryController = TextEditingController();
  TextEditingController indiaController = TextEditingController(text: "India");
  final ApiConnect _connect = Get.put(ApiConnect());
  RxList<GetAllCountryResponseData> getAllCountry = RxList();
  RxBool isLoading = RxBool(false);
  bool isCall = false;
  @override
  void onInit() {
    super.onInit();
    if (!isCall) {
      isCall = true;
      getAllCountries();
    }
  }

  getAllCountries() async {
    isLoading.value = true;
    var response = await _connect.getAllCountry();
    if (response.data != null) {
      getAllCountry.value = response.data!;
      debugPrint("getAllCountryResponse: ${response.toJson()}");
    } else {}
  }
}
