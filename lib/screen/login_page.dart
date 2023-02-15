//ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print, library_private_types_in_public_api, use_build_context_synchronously
import 'dart:async';

import 'package:attendance_manager/api_manager.dart';
import 'package:attendance_manager/shared_preference_key.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_manage.dart';
import '../strings.dart';
import '../databaseHandler/db_helper.dart';
import 'home_screen.dart';
import 'register_page.dart';
import '../routs.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  // key for form
  final formKey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final service = ApiServices();
  var dbHelper;
  bool _obscureText = false;
  double screenHeight = 0;
  double screenWidth = 0;

  // @override
  // initState() {
  //   super.initState();
  //   dbHelper = DbHelper();
  // }
  //
  // login() async {
  //   String email = controllerEmail.text;
  //   String passwd = controllerPassword.text;
  //
  //   if(email.isEmpty){
  //     Fluttertoast.showToast(msg: "Email field is Required", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0);
  //   }else if(passwd.isEmpty){
  //     Fluttertoast.showToast(msg: "Password field is Required", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0);
  //   }else{
  //     await dbHelper.getLoginUser(email, passwd).then((userData) {
  //       if(userData != null) {
  //         Navigator.pushAndRemoveUntil(
  //             context,
  //             MaterialPageRoute(builder: (_) => MyHomePage()),
  //                 (Route<dynamic> route) => false);
  //       } else {
  //         Fluttertoast.showToast(msg: "Error: User not found", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0);
  //       }
  //     }).catchError((error) {
  //       print(error);
  //       Fluttertoast.showToast(msg: "Error: Login Fail", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0);
  //     });
  //   }
  // }
  //MARK:API Call

  void initState(){
    super.initState();
    whereToGo();
  }

  callLoginApi() async{
    EasyLoading.show(status: 'loading...');
    var response =await  service.doLogin(controllerEmail.text, controllerPassword.text);
    if (response != null){
      EasyLoading.dismiss();
      // Navigator.of(context)
      //     .pushNamedAndRemoveUntil('/PunchPage', (Route<dynamic> route) => false);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          const PunchPage()), (Route<dynamic> route) => false);
      // Navigator.of(context)
      //     .pushNamedAndRemoveUntil(Routes.login,(Route<dynamic> route) => false);
      // const snackBar = SnackBar(content: Text('Login Done'));
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else {
      EasyLoading.dismiss();
      Fluttertoast.showToast(msg: "Error: User not found",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    print(response);
  }


  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      // appBar: AppBar(
      // backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      key: _scaffoldKey,
      resizeToAvoidBottomInset : false,
      //backgroundColor: Colors.grey[300],
      //**************** LinearGradient *****************
      // gradient: LinearGradient(
      //   begin: Alignment.topLeft,
      //   end: Alignment.bottomLeft,
      //   colors: [
      //     Color(0xffd1ccf6),
      //     Color(0xfffabbd4),
      //   ],
      // )
      //*************** //
        //************* Stack BackGround Image *************//
      // body: Stack(
      //   children: <Widget>[
      // SvgPicture.asset('lib/images/background.svg',
      //   fit: BoxFit.cover,
      // ),

        //*************

        body :Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/bg.png"),
                fit: BoxFit.cover
            ),
          ),        //padding: const EdgeInsets.only(left: 5, right: 5),
        child: Form(
          key: formKey, //key for form
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              //******** Top image screen start **********
              //     Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Image.asset('lib/images/top.png'),
              //   ],
              // ),
              const SizedBox(height: 170),
               Text(
                'Login',
                style: AppTextStyle.deepPurplefontbold50,
              ),
              const SizedBox(height: 10),
               Text(
                LocalisationString.lblLoginWelcomeMessage,
                style: AppTextStyle.blackfont16,
              ),
              const SizedBox(height: 10),
              SizedBox(
                child :Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controllerEmail,
                    decoration: InputDecoration(
                      fillColor: AppColor.transparent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      hintText: "Email Id",
                      contentPadding: const EdgeInsets.all(8),
                      prefixIcon: Icon(Icons.email ,color: AppColor.black),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "* Required";
                      }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                        return 'Please Enter Correct Email';
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controllerPassword,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        fillColor: AppColor.transparent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        suffixIcon: GestureDetector(onTap: (){
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                          child: Icon(_obscureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        hintText: "Enter Password",
                        contentPadding: const EdgeInsets.all(8),
                        prefixIcon: Icon(Icons.lock ,color: AppColor.black),
                      ),
                      validator: (value){
                        if((value!.isEmpty)){
                          return "* Required";
                        }else if(RegExp(" ").hasMatch(value)){
                          return ('Don\'t use Space');
                        }else{
                          return null;
                        }
                      },
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  minWidth: screenWidth/1, // <-- Your width
                  height: 40,
                  onPressed: () async {
                    var sharedPref = await SharedPreferences.getInstance();
                    sharedPref.setBool(SharedPrefrenceKey.sessionKey, true);
                    var isLoggedIn = sharedPref.getBool(SharedPrefrenceKey.sessionKey);
                    print(isLoggedIn);
                    if(formKey.currentState!.validate()){}
                    callLoginApi();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) =>  const MyHomePage()),
                    // );
                  },
                  shape: const StadiumBorder(),
                  color: AppColor.deepPurple,
                  textColor: AppColor.white,
                  child:const Text('Login'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: AppTextStyle.blackfont14,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: AppColor.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: AppColor.black),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: AppColor.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // google button
                  Image(image: AssetImage('lib/images/google.png'),
                    width: 100,
                    height: 40,),

                  SizedBox(width: 35),

                  // apple button
                  Image(image: AssetImage('lib/images/apple.png'),
                    width: 100,
                    height: 50,),
                ],
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(children: [
                   TextSpan(
                    text: 'Not a member? ',
                    style: AppTextStyle.blackfont15
                  ),
                  TextSpan(
                      text: ' Register now',
                      style: AppTextStyle.bluefont15,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegsiterPage()),
                          );
                        }),
                ]),
              ),
              //******** Bottom image screen start **********
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image.asset('lib/images/bottom.png'),
              //   ],
              // ),
            ],
          ),
        ),
      ),
      );
  }

  void whereToGo() async {

    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(SharedPrefrenceKey.sessionKey);

      if(isLoggedIn != null && isLoggedIn){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          const PunchPage()), (Route<dynamic> route) => false);
      }
  }
}