class SignInResponse {
  String? message;
  bool? error;
  Data? data;

  SignInResponse({this.message, this.error, this.data});

  SignInResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? userId;
  String? userName;
  String? placeOfBirth;
  String? dateOfBirth;
  String? timeOfBirth;
  String? maritalStatus;
  String? userLanguage;
  String? userCountry;
  String? bearerToken;

  Data(
      {this.userId,
        this.userName,
        this.placeOfBirth,
        this.dateOfBirth,
        this.timeOfBirth,
        this.maritalStatus,
        this.userLanguage,
        this.userCountry,
        this.bearerToken});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    placeOfBirth = json['placeOfBirth'];
    dateOfBirth = json['dateOfBirth'];
    timeOfBirth = json['timeOfBirth'];
    maritalStatus = json['maritalStatus'];
    userLanguage = json['userLanguage'];
    userCountry = json['userCountry'];
    bearerToken = json['bearerToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['placeOfBirth'] = this.placeOfBirth;
    data['dateOfBirth'] = this.dateOfBirth;
    data['timeOfBirth'] = this.timeOfBirth;
    data['maritalStatus'] = this.maritalStatus;
    data['userLanguage'] = this.userLanguage;
    data['userCountry'] = this.userCountry;
    data['bearerToken'] = this.bearerToken;
    return data;
  }
}