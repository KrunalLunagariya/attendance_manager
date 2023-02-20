import 'package:attendance_manager/shared_preference_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper{
  static Future saveString(String data, SharePreferenceKey sharedPreferenceKey) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   var status = await sharedPreferences.setString(sharedPreferenceKey.toString(), data);
  }

  static Future<String?> getString(SharePreferenceKey sharedPreferenceKey ) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(sharedPreferenceKey.toString());
  }

  static Future clearLocalAll() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.clear();
  }
}