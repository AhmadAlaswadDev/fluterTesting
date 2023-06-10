class GetTelrModel {
  Data? data;
  bool? success;
  int? status;

  GetTelrModel({this.data, this.success, this.status});

  GetTelrModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    success = json['success'];
    status = json['status'];
  }

}

class Data {
  String? redirectUrl;

  Data({this.redirectUrl});

  Data.fromJson(Map<String, dynamic> json) {
    redirectUrl = json['redirect_url'];
  }

}
