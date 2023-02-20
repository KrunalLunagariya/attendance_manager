import '../app_manage.dart';
import 'package:flutter/material.dart';
import '../strings.dart';
import 'employee_enter_otp_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ForgotPasswordPageState createState() => ForgotPasswordPageState();
}
class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  double screenHeight = 0;
  double screenWidth = 0;

  TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
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
        title: Text(AppbarTitleString.forgotPassword,
            style: AppTextStyle.blackBoldfont
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                      Text(
                        "+91",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone",
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 480),
              child: MaterialButton(
                minWidth: screenWidth/1, // <-- Your width
                height: screenHeight/13,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OtpPage()),
                  );
                },
                shape: const StadiumBorder(),
                color: AppColor.deepPurple,
                textColor: AppColor.white,
                child: Text(ButtonString.getOtp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}