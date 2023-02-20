import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../app_manage.dart';
import 'package:flutter/material.dart';
import '../strings.dart';
import 'employee_reset_password_page.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  OtpPageState createState() => OtpPageState();
}
class OtpPageState extends State<OtpPage> {
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
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              numberOfFields: 5,
              borderColor: const Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {
              },
              onSubmit: (String verificationCode){
                showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: const Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    }
                );
              }, // end onSubmit
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 480),
              child: MaterialButton(
                minWidth: screenWidth/1, // <-- Your width
                height: screenHeight/13,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ResetPasswordPage()),
                  );
                },
                shape: const StadiumBorder(),
                color: AppColor.deepPurple,
                textColor: AppColor.white,
                child: Text(ButtonString.submitOtp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}