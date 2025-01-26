import 'dart:convert';

import 'package:ashek_task_manager_getx/app/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

class AuthController {
  static String? accessToken;
  static UserModel? userModel;
  static String? userEmail;
  static String? userOTP;

  static const String _accessTokenKey = 'access-token';
  static const String _userDataKey = 'user-data';

  static final GetStorage _storage = GetStorage();

  static Future<void> saveUserData(String token, UserModel model) async {
    await _storage.write(_accessTokenKey, token);
    await _storage.write(_userDataKey, jsonEncode(model.toJson()));
    accessToken = token;
    userModel = model;
  }

  static Future<void> getUserData() async {
    String? token = _storage.read(_accessTokenKey);
    String? userData = _storage.read(_userDataKey);
    accessToken = token;
    userModel = UserModel.fromJson(jsonDecode(userData!));
  }

  static Future<bool> isUserLoggedIn() async {
    String? token = _storage.read(_accessTokenKey);
    if (token != null) {
      await getUserData();
      return true;
    }
    return false;
  }

  static Future<void> clearUserData() async {
    await _storage.erase();
  }
}
