import 'package:attendance_manager/app_manage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'employee_punch_page.dart';
import 'employee_report_page.dart';
import 'employee_Profile_page.dart';
class PunchPage extends StatefulWidget {
  const PunchPage({super.key});

  @override
  PunchPageState createState() => PunchPageState();
}

class PunchPageState extends State<PunchPage> {
  int page = 0;
  final screens=[
    const EmployeePunchPage(),
    const EmployeeReportPage(),
    const EmployeeProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      body: screens[page],
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        buttonBackgroundColor: AppColor.deepPurple,
        color: AppColor.white,
        backgroundColor: Colors.transparent,
        items:  <Widget>[
          Icon(Icons.alarm_on_rounded, size: 30, color: (page == 0)? AppColor.white : AppColor.black,),
          Icon(Icons.calendar_month_rounded, size: 30,color: (page == 1)? AppColor.white : AppColor.black,),
          Icon(Icons.person, size: 30,color: (page == 2)? AppColor.white : AppColor.black,),
        ],
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        letIndexChange: (screens) => true,
      ),
    );
  }
}
