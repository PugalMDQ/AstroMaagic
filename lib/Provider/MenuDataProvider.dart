import 'package:flutter/cupertino.dart';
import '../ResponseModel/AvailableDateResponse.dart';
import '../ResponseModel/GetAllServicesResponse.dart';
import '../ResponseModel/GetRemediesResponse.dart';
import '../ResponseModel/GetUserServiceResponse.dart';
import '../ResponseModel/ScheduleMeetingResponse.dart';
import '../ResponseModel/VastuPriceSlotResponse.dart';

class MenuDataProvider extends ChangeNotifier {

  String? verificationValues;
  String? isFromForgotOrRegister;
  String? eventURL;
  bool? isFromZoomMeeting = false;
  GetRemediesData? remediesData;
  DateTime? selectedMeetingTime;
  List<Spots>? spots;
  GetAllServicesData? allServicesData;
  UserServiceData? userServicesData;
  VastuPriceSlotResponseData? vastuValues;
  String? get getVerificationValues => verificationValues;
  String? get getIsFromForgotOrRegister => isFromForgotOrRegister;
  String? get getEventURL => eventURL;
  GetAllServicesData? get getAllServicesData => allServicesData;
  UserServiceData? get getUserServicesData => userServicesData;
  GetRemediesData? get getRemediesData => remediesData;
  bool? get getIsFromZoomMeeting => isFromZoomMeeting;
  DateTime? get getSelectedMeetingTime => selectedMeetingTime;
  List<Spots>? get getSpots => spots;
  VastuPriceSlotResponseData? get getVastuData => vastuValues;
  Data? meetingData;
  Data? get getMeetingData => meetingData;

  void setVerificationValues(String? data) {
    verificationValues = data ?? "";
    notifyListeners();
  }
  void setIsFromForgotOrRegister(String? data) {
    isFromForgotOrRegister = data ?? "";
    notifyListeners();
  }
  void setEventURL(String? data) {
    eventURL = data ?? "";
    notifyListeners();
  }
  void setIsFromZoomMeeting(bool? data) {
    isFromZoomMeeting = data ?? false;
    notifyListeners();
  }
 void setSelectedMeetingTime(DateTime? data) {
   selectedMeetingTime = data;
    notifyListeners();
  }

  void setSpots(List<Spots>? data) {
    spots = data;
    notifyListeners();
  }

  void setAllServicesData(GetAllServicesData? data) {
    allServicesData = data;
    notifyListeners();
  }
  void setUserServicesData(UserServiceData? data) {
    userServicesData = data;
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


  void setMeetingData(Data? data) {
    meetingData = data;
    notifyListeners();
  }
}
