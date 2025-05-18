import 'package:flutter_web/data/models/signIn/User_model.dart';
//step-1-p1
class SignInResponse {
  SignInResponse({
      this.message,
      this.token,
      this.user,});

  SignInResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }
  String? message;
  String? token;
  UserModel? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}