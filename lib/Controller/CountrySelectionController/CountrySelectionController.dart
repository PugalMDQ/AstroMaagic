import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../Api_Connect/ApiConnect.dart';
import '../../Provider/MenuDataProvider.dart';
import '../../ResponseModel/GetAllCountrysResponse.dart';

class CountrySelectionScreenController extends GetxController {
  TextEditingController countryController = TextEditingController();
  TextEditingController indiaController = TextEditingController(text: "India");
  final ApiConnect _connect = Get.put(ApiConnect());
  RxList<GetAllCountryResponseData> getAllCountry = RxList();
  RxBool isLoading = RxBool(false);
  bool isCall = false;
  late MenuDataProvider userDataProvider;

  @override
  void onInit() {
    super.onInit();
    if (!isCall) {
      isCall = true;
      getAllCountries();
    }
    userDataProvider =
        Provider.of<MenuDataProvider>(Get.context!, listen: false);

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
