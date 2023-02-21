// ignore_for_file: file_names, deprecated_member_use, avoid_print
import 'package:attendance_manager/app_manage.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../strings.dart';


class TermsAndConditionPage extends StatefulWidget {
  const TermsAndConditionPage({Key? key}) : super(key: key);
  @override
  TermsCondition createState() => TermsCondition();

}

class TermsCondition extends State<TermsAndConditionPage>{
  double screenHeight = 0;
  double screenWidth = 0;
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(AppbarTitleString.termsCondition,
            style: AppTextStyle.blackBoldfont,
          ),
        ),
        body: WebView(
            javascriptMode: JavascriptMode.unrestricted,
          initialUrl: "https://www.termsandconditionsgenerator.com/live.php?token=ENKoeOINTRfBA0CdOHMhroCMWc75AnYI",
          onWebViewCreated: (controller){
              this.controller = controller;
          },

        )
    );
  }
}


