// ignore_for_file: use_key_in_widget_constrouctors
import 'package:attendance_manager/screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'screen/home_screen.dart';
import 'routs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      //theme: ThemeData(primarySwatch: Colors.deepPurple),
      builder: EasyLoading.init(),
      routes: {
        Routes.register: (context) => const MyHomePage(),
        Routes.firstscreen: (context) => const MyApp(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      Navigator.pushReplacementNamed(context, Routes.firstscreen);
    });
  }

  final bool visible = true;
  double opacityLevel = 1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedOpacity(
          opacity: opacityLevel == 0 ? 1.0 : 0.0,
          duration: const Duration(seconds: 3),
          child: Image.asset('lib/images/splash_logo.png'),
        ),
      ],
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