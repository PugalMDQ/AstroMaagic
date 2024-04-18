import 'package:astromaagic/ResponseModel/AddUserServiceResponse.dart';
import 'package:astromaagic/ResponseModel/CommonResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/connect.dart';

import '../Api_Config/ApiUrl.dart';
import '../ResponseModel/GetAllCountrysResponse.dart';
import '../ResponseModel/GetAllServicesResponse.dart';
import '../ResponseModel/GetParticularServicesResponse.dart';
import '../ResponseModel/GetRemediesResponse.dart';
import '../ResponseModel/GetUserServiceResponse.dart';
import '../ResponseModel/SignInResponse.dart';
import '../ResponseModel/SignUpResponse.dart';
import '../ResponseModel/VastuPriceSlotResponse.dart';
import '../Utils/AppPreference.dart';
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

  Future<SignInResponse> login(Map<String, dynamic> payload) async {
    FormData formData = FormData(payload);
    var response = await post(ApiUrl.baseUrl + ApiUrl.login, formData);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return SignInResponse.fromJson(response.body);
  }

  Future<GetAllCountryResponse> getAllCountry() async {
    Map<String, dynamic> payload = {"dataPerPage": "1000", "pageNo": "1"};
    FormData formData = FormData(payload);
    var response = await post(ApiUrl.baseUrl + ApiUrl.all_country, formData);
    print("response");
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    print(response.body);
    return GetAllCountryResponse.fromJson(response.body);
  }

  Future<SignUpResponse> register(Map<String, dynamic> payload) async {
    FormData formData = FormData(payload);
    var response = await post(ApiUrl.baseUrl + ApiUrl.add_users, formData);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return SignUpResponse.fromJson(response.body);
  }

  Future<CommonResponse> commonUpload(Map<String, dynamic> payload) async {
    FormData formData = FormData(payload);
    var response = await post(ApiUrl.baseUrl + ApiUrl.forgot, formData);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return CommonResponse.fromJson(response.body);
  }

  Future<GetAllServicesResponse> getAllServicesCall(
      Map<String, dynamic> payload) async {
    Map<String, String> header = {
      'Authorization': AppPreference().getToken.toString(),
      'loginUserId': AppPreference().getLoginUserId.toString(),
    };
    FormData formData = FormData(payload);
    var response = await post(ApiUrl.baseUrl + ApiUrl.getAllServices, formData,
        headers: header);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return GetAllServicesResponse.fromJson(response.body);
  }

  Future<GetParticularServicesResponse> getParticularServicesCall(
      Map<String, dynamic> payload) async {
    Map<String, String> header = {
      'Authorization': AppPreference().getToken.toString(),
      'loginUserId': AppPreference().getLoginUserId.toString(),
    };
    FormData formData = FormData(payload);
    var response = await post(
        ApiUrl.baseUrl + ApiUrl.getParticularServices, formData,
        headers: header);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return GetParticularServicesResponse.fromJson(response.body);
  }

  Future<GetRemediesResponse> getRemediesServicesCall(
      Map<String, dynamic> payload) async {
    Map<String, String> header = {
      'Authorization': AppPreference().getToken.toString(),
      'loginUserId': AppPreference().getLoginUserId.toString(),
    };
    FormData formData = FormData(payload);
    var response = await post(ApiUrl.baseUrl + ApiUrl.getRemedies, formData,
        headers: header);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return GetRemediesResponse.fromJson(response.body);
  }

  Future<VastuPriceSlotResponse> vastuPriceSlot(
      Map<String, dynamic> payload) async {
    Map<String, String> header = {
      'Authorization': AppPreference().getToken.toString(),
      'loginUserId': AppPreference().getLoginUserId.toString(),
    };
    FormData formData = FormData(payload);
    var response = await post(ApiUrl.baseUrl + ApiUrl.vastuPriceSlot, formData,
        headers: header);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return VastuPriceSlotResponse.fromJson(response.body);
  }

  Future<AddUserServiceResponse> addUserCall(
      Map<String, dynamic> payload) async {
    Map<String, String> header = {
      'Authorization': AppPreference().getToken.toString(),
      'loginUserId': AppPreference().getLoginUserId.toString(),
    };
    FormData formData = FormData(payload);
    var response = await post(ApiUrl.baseUrl + ApiUrl.addUserService, formData,
        headers: header);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return AddUserServiceResponse.fromJson(response.body);
  }

  Future<GetUserServiceResponse> getUserServicesCall(
      Map<String, dynamic> payload) async {
    Map<String, String> header = {
      'Authorization': AppPreference().getToken.toString(),
      'loginUserId': AppPreference().getLoginUserId.toString(),
    };
    FormData formData = FormData(payload);
    var response = await post(ApiUrl.baseUrl + ApiUrl.getUserService, formData,
        headers: header);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return GetUserServiceResponse.fromJson(response.body);
  }
}
