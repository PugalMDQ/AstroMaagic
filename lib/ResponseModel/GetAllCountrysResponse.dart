class GetAllCountryResponse {
  String? message;
  bool? error;
  List<GetAllCountryResponseData>? data;

  GetAllCountryResponse({this.message, this.error, this.data});

  GetAllCountryResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    if (json['data'] != null) {
      data = <GetAllCountryResponseData>[];
      json['data'].forEach((v) {
        data!.add(new GetAllCountryResponseData.fromJson(v));
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

class GetAllCountryResponseData {
  int? countryId;
  String? countryName;

  GetAllCountryResponseData({this.countryId, this.countryName});

  GetAllCountryResponseData.fromJson(Map<String, dynamic> json) {
    countryId = json['countryId'];
    countryName = json['countryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryId'] = this.countryId;
    data['countryName'] = this.countryName;
    return data;
  }
}