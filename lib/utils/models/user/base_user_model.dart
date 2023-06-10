import 'package:zaheed/utils/models/user/user_model.dart';


class BaseUserModel {
  bool? result;
  String? message;
  String? accessToken;
  String? tokenType;
  String? expiresAt;
  String? sessionInfo;
  User? user;

  BaseUserModel(
      {this.result,
        this.message,
        this.accessToken,
        this.tokenType,
        this.expiresAt,
        this.sessionInfo,
        this.user});

  BaseUserModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresAt = json['expires_at'];
    sessionInfo = json['sessionInfo'];
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
  }

}