// ignore_for_file: unnecessary_null_comparison

import 'package:fluttertoast/fluttertoast.dart';

import '../app_manage.dart';
import 'package:flutter/material.dart';
import '../strings.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  ChangePassword createState() => ChangePassword();
}
class ChangePassword extends State<ChangePasswordPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController controllerCurrentPassword = TextEditingController();
  TextEditingController controllerNewPassword = TextEditingController();
  TextEditingController controllerConfirmPassword = TextEditingController();
   bool _obscureText = false;
  double screenHeight = 0;
  double screenWidth = 0;

  changePassword(){
    String currentPassword = controllerCurrentPassword.text;
    String newPassword = controllerNewPassword.text;
    String confirmPassword = controllerConfirmPassword.text;

    if(formKey.currentState!.validate()) {
      if(currentPassword == null){
        Fluttertoast.showToast(msg: "Current Password *Required",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0);

      }else if  (newPassword != confirmPassword) {
        Fluttertoast.showToast(msg: "Password Mismatch",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(msg: "Confirm",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.black,
            fontSize: 16.0);
      }
    }

  }
  
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(AppbarTitleString.changePassword,
            style: AppTextStyle.blackBoldfont
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: controllerCurrentPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
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
                        labelText: LocalisationString.lblCurrentPassword,
                      ),
                      obscureText: _obscureText,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: controllerNewPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
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
                        labelText: LocalisationString.lblNewPassword,
                      ),
                      obscureText: _obscureText,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: controllerConfirmPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: LocalisationString.lblConfirmPassword,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 150),
                  child: MaterialButton(
                    minWidth: screenWidth/1, // <-- Your width
                    height: screenHeight/13,
                    onPressed: (){
                      if(formKey.currentState!.validate()){}
                      changePassword();
                    },
                    shape: const StadiumBorder(),
                    color: AppColor.deepPurple,
                    textColor: AppColor.white,
                    child: Text(ButtonString.changePassword),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
