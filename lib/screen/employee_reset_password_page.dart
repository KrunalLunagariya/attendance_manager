import '../app_manage.dart';
import 'package:flutter/material.dart';
import '../strings.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  ResetPasswordPageState createState() => ResetPasswordPageState();
}
class ResetPasswordPageState extends State<ResetPasswordPage> {
  bool _obscureText = false;
  double screenHeight = 0;
  double screenWidth = 0;

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
        title: Text(AppbarTitleString.forgotPassword,
            style: AppTextStyle.blackBoldfont
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
              child: SizedBox(
                height: 50,
                child: TextField(
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
                child: TextField(
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
                    labelText: LocalisationString.lblConfirmPassword,
                  ),
                  obscureText: _obscureText,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 400),
              child: MaterialButton(
                minWidth: screenWidth/1, // <-- Your width
                height: screenHeight/13,
                onPressed: (){
                },
                shape: const StadiumBorder(),
                color: AppColor.deepPurple,
                textColor: AppColor.white,
                child: Text(ButtonString.resetPassword),
              ),
            ),
          ],
        ),
      ),
    );
  }
}