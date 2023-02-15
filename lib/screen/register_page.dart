// ignore_for_file: use_build_context_synchronously, avoid_print, must_be_immutable
import 'package:attendance_manager/app_manage.dart';
import 'package:attendance_manager/models/user_model.dart';
import 'package:attendance_manager/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:attendance_manager/api_manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../custom_text_field.dart';
import '../databaseHandler/db_helper.dart';
import 'login_page.dart';
import '../routs.dart';

class RegsiterPage extends StatefulWidget {
  const RegsiterPage({Key? key}) : super(key: key);

  @override
  RegsiterPageDesign createState() => RegsiterPageDesign();
}

class RegsiterPageDesign extends State<RegsiterPage> {

  final formKey = GlobalKey<FormState>();
   final conUserName = TextEditingController();
   final conEmail = TextEditingController();
   final conPassword = TextEditingController();
   final conConfirmPassword = TextEditingController();
   final service = ApiServices();
  // var dbHelper = DbHelper();
   double screenHeight = 0;
   double screenWidth = 0;


  // ##### for register sqflite database ###### //


  //  @override
  //  void initState() {
  //    super.initState();
  //    dbHelper = DbHelper();
  //  }
  //
  // signUp() async {
  //    String uname = conUserName.text;
  //    String email = conEmail.text;
  //    String passwd = conPassword.text;
  //    String cpasswd = conConfirmPassword.text;
  //    // print("password");
  //    // print("${passwd} $cpasswd");
  //    // print("${passwd != cpasswd}");
  //    // print("${formKey.currentState!.validate()}");
  //    if(formKey.currentState!.validate()){
  //       if(passwd != cpasswd){
  //         Fluttertoast.showToast(msg: "Password Mismatch", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0);
  //       }else {
  //         formKey.currentState?.save();
  //
  //         UserModel uModel = UserModel(uname, email, passwd);
  //         await dbHelper.saveData(uModel).then((userData) {
  //           Fluttertoast.showToast(msg: "Successfully Saved", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.green, textColor: Colors.white, fontSize: 16.0);
  //
  //           Navigator.push(
  //               context, MaterialPageRoute(builder: (_) => LoginPage()));
  //         }).catchError((error) {
  //           print(error.toString());
  //           Fluttertoast.showToast(msg: "Error: Data Save Fail", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0);
  //         });
  //       }
  //    }
  //  }


   //MARK:API Call
   // callRegisterApi(BuildContext context) async{
   //   EasyLoading.show(status: 'loading...');
   //   var response =await  service.doRegister(email.text, password.text);
   //   if (response != null){
   //     EasyLoading.dismiss();
   //     Navigator.of(context)
   //         .pushNamedAndRemoveUntil(Routes.register, (Route<dynamic> route) => false);
   //     // const snackBar = SnackBar(content: Text('Register Done'));
   //     // ScaffoldMessenger.of(context).showSnackBar(snackBar);
   //   } else {
   //     EasyLoading.dismiss();
   //    showSnackBar(context: context, message: 'Register Not Succesfull!');
   //   }
   //   print(response);
   //   // service.apiCallLogin(
   //   //  " {
   //   //     "email": emailText.text,
   //   //     "password": passwordText.text,
   //   //   },
   //   // ).then((value){
   //   //   if(value?.error != null){
   //   //    // print("get data >>>>>> " + value?.error!);
   //   //   }else{
   //   //     print(value?.token!);
   //   //     //push
   //   //   }
   //   // });
   // }
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
        resizeToAvoidBottomInset : false,
       // backgroundColor: Colors.grey[300],
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/images/bg.png"),
              fit: BoxFit.cover
          ),
        ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 190),
             Text(
              'Registration',
              style: AppTextStyle.deepPurplefontbold50
            ),
            const SizedBox(height: 20),
             Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(hintText: "Enter User Name", prefixIcon: Icon(Icons.person, color: AppColor.black),controller: conUserName,)),
             Padding(
                // ignore: prefer_const_constructors
                padding: EdgeInsets.all(8.0),
                child: CustomTextField(hintText: "Enter Email", prefixIcon:  Icon(Icons.email, color: AppColor.black), controller: conEmail,)),
             Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(hintText: "Enter Password", prefixIcon:  Icon(Icons.lock, color: AppColor.black), obscureText: true, controller: conPassword,)),
             Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(hintText: "Retype Password", prefixIcon: Icon(Icons.lock, color: AppColor.black),obscureText: true,controller: conConfirmPassword,)),
            Padding(
              padding:  const EdgeInsets.all(8.0),
              child: MaterialButton(
                minWidth: screenWidth/1, // <-- Your width
                height: 40,
                onPressed: (){
                  // if(formKey.currentState!.validate()){
                  //   const snackBar = SnackBar(content: Text('Register Done'));
                  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  //   // var showSnackBar = _scaffoldKey.currentState!.showSnackBar(snackBar);
                  // }
                  // callRegisterApi(context);
                },
                shape: const StadiumBorder(),
                color: AppColor.deepPurple,
                textColor: AppColor.white,
                child: Text(
                  'Register',
                  style: AppTextStyle.simplefont16,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child :RichText(
                text: TextSpan(children: [
                   TextSpan(
                    text: 'Already have\'n account? ',
                    style: TextStyle(
                      color: AppColor.black,
                    ),
                  ),
                  TextSpan(
                      text: 'Login now',
                      style: TextStyle(
                        color: AppColor.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                        }
                ),
                ]),
              ),
            )]
        ),
      ),
    )
    );
  }
}

//Krunal
