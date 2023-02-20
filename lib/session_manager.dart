import 'dart:convert';

import 'package:attendance_manager/models/user_model.dart';
import 'package:attendance_manager/shared_preference_helper.dart';
import 'package:attendance_manager/shared_preference_key.dart';

class SessionManager {
  static saveUserInfo(UserModel userModel) async {
    Map userDict = userModel.toJson();
    String userEncoded = jsonEncode(userDict);
    await SharedPreferenceHelper.saveString(userEncoded, SharePreferenceKey.sessionKey);
  }

  static Future<UserModel?> getUserInfo() async {
    String? encodeUser = await SharedPreferenceHelper.getString(SharePreferenceKey.sessionKey);
    if (encodeUser != null){
      Map<String, dynamic> userDict = jsonDecode(encodeUser);
      return UserModel.fromJson(userDict);
    }
    return null;
  }

  static logoutUser() async{
    await SharedPreferenceHelper.clearLocalAll();
  }

}