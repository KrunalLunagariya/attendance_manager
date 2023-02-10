// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dio/dio.dart';

class APIConstants {
  static String baseURL = "https://reqres.in/api/";
}

class ApiServices{
  var dio = Dio();

  Future <LoginApiResponse?> doAPIPOSTRequest({required String path,  Map<String,dynamic>? parameters}) async{
    dio.options = BaseOptions(baseUrl: APIConstants.baseURL);
    try {
      var response = await dio.post(path, data: jsonEncode(
          parameters));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');
      final data = response.data;
      return LoginApiResponse(token: data["token"]);
    } catch(e) {
      print(e);
    }
    return null;
  }
  Future doLogin(String email, String password) async{
    return await doAPIPOSTRequest(path: "login", parameters: {"email": email, "password": password});
  }
  Future doRegister(String email, String password) async{
    return await doAPIPOSTRequest(path: "register", parameters: {"email": email, "password": password});
  }
}
class LoginApiResponse{
  final String? token;
  final String? error;
  LoginApiResponse({this.token,this.error});
}
//***********************

class RegisterApiResponse{
  final String? token;
  final String? error;
  RegisterApiResponse({this.token,this.error});
}
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class ApiServices{
//
//   Future <LoginApiResponse> apiCallLogin(Map<String,dynamic> param) async{
//
//     var url = Uri.parse('https://reqres.in/api/login');
//     var response = await http.post(url, body: param);
//     print('Response status: ${response.statusCode}');
//     print('Response status: ${response.statusCode==200?"Successfully": "You are not Login"}');
//     print('Response body: ${response.body}');
//
//     final data = jsonDecode(response.body);
//     return LoginApiResponse(token: data["token"], error: data["error"]);
//   }
// }
//
// class LoginApiResponse{
//   final String? token;
//   final String? error;
//
//   LoginApiResponse({this.token,this.error});
//
// }