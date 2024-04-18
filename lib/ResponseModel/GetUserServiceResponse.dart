class GetUserServiceResponse {
  String? message;
  bool? error;
  List<UserServiceData>? data;

  GetUserServiceResponse({this.message, this.error, this.data});

  GetUserServiceResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    if (json['data'] != null) {
      data = <UserServiceData>[];
      json['data'].forEach((v) {
        data!.add(new UserServiceData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserServiceData {
  int? userServiceId;
  String? userName;
  int? serviceId;
  String? services;
  String? serviceDescription;
  int? remedyId;
  String? remedy;
  int? remedyChargeId;
  String? noOfQuestions;
  String? responseTime;
  String? meetingDuration;
  int? fees;
  String? createdDateTime;

  UserServiceData(
      {this.userServiceId,
      this.userName,
      this.serviceId,
      this.services,
      this.serviceDescription,
      this.remedyId,
      this.remedy,
      this.remedyChargeId,
      this.noOfQuestions,
      this.responseTime,
      this.meetingDuration,
      this.fees,
      this.createdDateTime});

  UserServiceData.fromJson(Map<String, dynamic> json) {
    userServiceId = json['userServiceId'];
    userName = json['userName'];
    serviceId = json['serviceId'];
    services = json['services'];
    serviceDescription = json['serviceDescription'];
    remedyId = json['remedyId'];
    remedy = json['remedy'];
    remedyChargeId = json['remedyChargeId'];
    noOfQuestions = json['noOfQuestions'];
    responseTime = json['responseTime'];
    meetingDuration = json['meetingDuration'];
    fees = json['fees'];
    createdDateTime = json['createdDateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userServiceId'] = this.userServiceId;
    data['userName'] = this.userName;
    data['serviceId'] = this.serviceId;
    data['services'] = this.services;
    data['serviceDescription'] = this.serviceDescription;
    data['remedyId'] = this.remedyId;
    data['remedy'] = this.remedy;
    data['remedyChargeId'] = this.remedyChargeId;
    data['noOfQuestions'] = this.noOfQuestions;
    data['responseTime'] = this.responseTime;
    data['meetingDuration'] = this.meetingDuration;
    data['fees'] = this.fees;
    data['createdDateTime'] = this.createdDateTime;
    return data;
  }
}
