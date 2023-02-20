import 'package:attendance_manager/routs.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}


class SplashScreenState extends State<SplashScreen>{

   @override
  void initState(){
    super.initState();
    navigateToLogin();
  }

   navigateToLogin() async {
     await Future.delayed(const Duration(milliseconds: 2000),(){
       Navigator.pushReplacementNamed(context,  Routes.loginscreen);
     });
   }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Welcome....!',
          style: TextStyle(
              fontSize: 30,
              color: Colors.black
          ),
        ),
      ),
    );
  }
}
