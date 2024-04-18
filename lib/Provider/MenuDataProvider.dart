import 'package:flutter/cupertino.dart';
import '../ResponseModel/GetAllServicesResponse.dart';
import '../ResponseModel/GetRemediesResponse.dart';
import '../ResponseModel/VastuPriceSlotResponse.dart';

class MenuDataProvider extends ChangeNotifier {

  String? verificationValues;
  String? isFromForgotOrRegister;
  GetRemediesData? remediesData;
  GetAllServicesData? allServicesData;
  VastuPriceSlotResponseData? vastuValues;


  String? get getVerificationValues => verificationValues;
  String? get getIsFromForgotOrRegister => isFromForgotOrRegister;
  GetAllServicesData? get getAllServicesData => allServicesData;
  GetRemediesData? get getRemediesData => remediesData;
  VastuPriceSlotResponseData? get getVastuData => vastuValues;


  void setVerificationValues(String? data) {
    verificationValues = data ?? "";
    notifyListeners();
  }
  void setIsFromForgotOrRegister(String? data) {
    isFromForgotOrRegister = data ?? "";
    notifyListeners();
  }


  void setAllServicesData(GetAllServicesData? data) {
    allServicesData = data;
    notifyListeners();
  }

  void setRemediesData(GetRemediesData? data) {
    remediesData = data;
    notifyListeners();
  }

  bool setVastuData(VastuPriceSlotResponseData? data) {
    vastuValues = data;
    notifyListeners();
    return true;
  }
}
