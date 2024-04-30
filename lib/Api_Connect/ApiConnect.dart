import 'dart:convert';

import 'package:astromaagic/ResponseModel/AddUserServiceResponse.dart';
import 'package:astromaagic/ResponseModel/CommonResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/connect.dart';

import '../Api_Config/ApiUrl.dart';
import '../ResponseModel/AcceptUserServiceResponse.dart';
import '../ResponseModel/AvailableDateResponse.dart';
import '../ResponseModel/GetAllCountrysResponse.dart';
import '../ResponseModel/GetAllServicesResponse.dart';
import '../ResponseModel/GetEditProfileResponse.dart';
import '../ResponseModel/GetParticularServicesResponse.dart';
import '../ResponseModel/GetRemediesResponse.dart';
import '../ResponseModel/GetUserServiceResponse.dart';
import '../ResponseModel/GetViewPdfResponse.dart';
import '../ResponseModel/MobileNumberResponse.dart';
import '../ResponseModel/OtpVerifyResponse.dart';
import '../ResponseModel/PaymentSuccessResponse.dart';
import '../ResponseModel/ScheduleMeetingResponse.dart';
import '../ResponseModel/ScheduleResponse.dart';
import '../ResponseModel/SignInResponse.dart';
import '../ResponseModel/SignUpResponse.dart';
import '../ResponseModel/UpdateProfile.dart';
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

  Future<GetAllCountryResponse> getAllCountry(int pageNum) async {
    Map<String, dynamic> payload = {"dataPerPage": "250", "pageNo": pageNum};
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

  addUserCall(
      Map<String, dynamic> payload) async {
    Map<String, String> header = {
      'Authorization': AppPreference().getToken.toString(),
      'loginUserId': AppPreference().getLoginUserId.toString(),
    };
    FormData formData = FormData(payload);
    var response = await post(ApiUrl.baseUrl + ApiUrl.addUserService, formData,
        headers: header);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return response.body;
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
  Future<GetViewPdfResponse> getViewPdfCall(
      Map<String, dynamic> payload) async {
    Map<String, String> header = {
      'Authorization': AppPreference().getToken.toString(),
      'loginUserId': AppPreference().getLoginUserId.toString(),

    };
    FormData formData = FormData(payload);
    var response = await post(ApiUrl.baseUrl + ApiUrl.getViewPdf, formData,
        headers: header);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return GetViewPdfResponse.fromJson(response.body);
  }



  Future<ScheduleResponse> scheduleEvent(
      Map<String, dynamic> payload) async {
    Map<String, String> header = {
      'Authorization': AppPreference().getToken.toString(),
      'loginUserId': AppPreference().getLoginUserId.toString(),
    };

    FormData formData = FormData(payload);
    var response = await post(ApiUrl.baseUrl + ApiUrl.scheduleEvent, formData,);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return ScheduleResponse.fromJson(response.body);
  }


  Future<PaymentSuccessResponse> getPaymentSuccess(
      Map<String, dynamic> payload) async {
    Map<String, String> header = {
      'Authorization': AppPreference().getToken.toString(),
      'loginUserId': AppPreference().getLoginUserId.toString(),
    };

    FormData formData = FormData(payload);
    var response = await post(ApiUrl.baseUrl + ApiUrl.paymentProcess, formData,
        headers: header);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return PaymentSuccessResponse.fromJson(response.body);
  }

  Future<ScheduleMeetingResponse> scheduleMeetingCall(
      Map<String, dynamic> payload) async {
    Map<String, String> header = {
      'Authorization': AppPreference().getToken.toString(),
      'loginUserId': AppPreference().getLoginUserId.toString(),
    };
    FormData formData = FormData(payload);
    var response = await post(ApiUrl.baseUrl + ApiUrl.scheduleMeeting, formData,
        headers: header);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return ScheduleMeetingResponse.fromJson(response.body);
  }

  Future<AvailableDateResponse> getAllEventSlot(
      Map<String, dynamic> payload) async {
    FormData formData = FormData(payload);
    var response = await post(ApiUrl.baseUrl + ApiUrl.getAllEventSlots, formData);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return AvailableDateResponse.fromJson(response.body);
  }

  Future<EditProfileResponse> getEditProfileCall(
      Map<String, dynamic> payload) async {
    Map<String, String> header = {
      'Authorization': AppPreference().getToken.toString(),
      'loginUserId': AppPreference().getLoginUserId.toString(),
    };
    FormData formData = FormData(payload);
    var response = await post(ApiUrl.baseUrl + ApiUrl.getEditProfile, formData,
        headers: header);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return EditProfileResponse.fromJson(response.body);
  }

  Future<UpdateProfileResponse> getUpdateProfileCall(
      Map<String, dynamic> payload) async {
    Map<String, String> header = {
      'Authorization': AppPreference().getToken.toString(),
      'loginUserId': AppPreference().getLoginUserId.toString(),
    };
    FormData formData = FormData(payload);
    var response = await post(
        ApiUrl.baseUrl + ApiUrl.getUpdateProfile, formData,
        headers: header);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return UpdateProfileResponse.fromJson(response.body);
  }

  Future<AcceptUserServiceResponse> acceptUserServiceCall(
      Map<String, dynamic> payload) async {
    Map<String, String> header = {
      'Authorization': AppPreference().getToken.toString(),
      'loginUserId': AppPreference().getLoginUserId.toString(),
    };
    FormData formData = FormData(payload);
    var response = await post(
        ApiUrl.baseUrl + ApiUrl.acceptUserService, formData,
        headers: header);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return AcceptUserServiceResponse.fromJson(response.body);
  }
  Future<OtpVerifyResponse> otpVerifyCall(
      Map<String, dynamic> payload) async {
    FormData formData = FormData(payload);
    var response = await post(ApiUrl.baseUrl + ApiUrl.otpVerify, formData);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return OtpVerifyResponse.fromJson(response.body);
  }


  Future<MobileNumberResponse> mobileNumberCall(
      Map<String, dynamic> payload) async {
    FormData formData = FormData(payload);
    var response = await post(ApiUrl.baseUrl + ApiUrl.mobileNumber, formData);
    if (response.body == null) throw Exception(AppUtility.connectivityMessage);
    return MobileNumberResponse.fromJson(response.body);
  }



}
