import 'package:flutter/material.dart';

import '../api/api_handler.dart';
import '../api/api_route.dart';
import '../components/app_func.dart';
import '../model/app_model.dart';
import '../model/login_model.dart';

class UserRepo {
  static AppModel onResponse(AppModel model) {
    if (model.code == 100) {
      return model;
    } else if (model.message != null) {
      showMessage(model.message);
    } else {
      showMessage("Something went wrong, please try again.");
    }
    return null;
  }

  static Future<LoginModel> login(
      {@required String email,
      @required String password,
      @required int userType}) async {
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
      'userType': userType.toString()
    };

    var responseBody = await API.apiHandler(
        url: APIRoute.loginUrl, apiType: APIType.aPost, body: body);

    if (responseBody != null) {
      return onResponse(loginModelFromJson(responseBody));
    } else {
      return null;
    }
  }

  static Future<AppModel> signup(
      {@required String name,
      @required String email,
      @required String password,
      @required String filepath,
      @required int userType}) async {
    Map<String, dynamic> body = {
      'name': name,
      'email': email,
      'password': password,
      'filepath': filepath,
      'userType': userType.toString()
    };

    var responseBody = await API.apiHandler(
        url: APIRoute.signupUrl, apiType: APIType.aMultipart, body: body);

    if (responseBody != null) {
      return onResponse(appModelFromJson(responseBody));
    } else {
      return null;
    }
  }
}
