// ignore_for_file: use_key_in_widget_constrouctors
import 'package:attendance_manager/screen/login_page.dart';
import 'package:attendance_manager/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'screen/home_screen.dart';
import 'routs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}
class MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(primarySwatch: Colors.deepPurple),
      builder: EasyLoading.init(),
      initialRoute: Routes.splashScreen,
      routes: {
        Routes.homescreen: (context) => const PunchPage(),
        Routes.loginscreen:(context) => const LoginPage(),
        Routes.splashScreen:(context) => const SplashScreen(),
      },
    );
  }
}


// import 'package:flutter/material.dart';
// import 'cubit/counter_cubit.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'cubit_home_page.dart';
//
// void main() => runApp(CubitCounter());
//
// class CubitCounter extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlocProvider(
//         create: (_) => CounterCubit(),
//         child: CounterPage(),
//       ),
//     );
//   }
// }