import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/connect.dart';

import '../Api_Config/ApiUrl.dart';
import '../ResponseModel/GetAllCountrysResponse.dart';
import '../ResponseModel/SignUpResponse.dart';
import '../Utils/app_utility.dart';

class ApiConnect extends GetConnect {
  @override
  onInit() {
    super.allowAutoSignedCert = true;
    super.onInit();

    httpClient.addResponseModifier((request, response) {
      debugPrint("------------ AUTH ------------");
      debugPrint(
          "REQUEST METHOD: ${request.method} ; ENDPOINT:  ${request.url}");
      debugPrint("RESPONSE : ${response.bodyString}");
      return response;
    });
  }

  Future<SignUpResponse> login(Map<String, dynamic> payload) async {
    FormData formData = FormData(payload);
    var response = await post(ApiUrl.baseUrl + ApiUrl.add_users, formData);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return SignUpResponse.fromJson(response.body);
  }
  Future<GetAllCountryResponse> getAllCountry() async {
    var response = await get(ApiUrl.baseUrl + ApiUrl.all_country);
    print("response");
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    print(response.body);
    return GetAllCountryResponse.fromJson(response.body);
  }

}