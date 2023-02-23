// ignore_for_file: file_names, deprecated_member_use, avoid_print
import 'package:attendance_manager/app_manage.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../strings.dart';


class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);
  @override
  PrivacyPolicy createState() => PrivacyPolicy();

}

class PrivacyPolicy extends State<PrivacyPolicyPage>{
  double screenHeight = 0;
  double screenWidth = 0;
  bool isLoading = true;
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(AppbarTitleString.privacyPolicy,
            style: AppTextStyle.blackBoldfont,
          ),
        ),
        body: Stack(
          children: [
            WebView(
            initialUrl: "https://www.freeprivacypolicy.com/live/0d549f78-58d8-46b5-8a3a-596ddbe58d43",
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
            javascriptMode: JavascriptMode.unrestricted,
             onWebViewCreated: (controller){
              this.controller = controller;
            },
          ),
        Visibility(
          visible: isLoading,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        )
    ]
    )
    );
  }
}


