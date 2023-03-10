// ignore_for_file: file_names
import 'package:attendance_manager/app_manage.dart';
import 'package:attendance_manager/screen/employee_about_us_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../alert_dialog.dart';
import '../models/user_model.dart';
import '../session_manager.dart';
import '../strings.dart';
import 'employee_change_password_page.dart';
import 'employee_holiday_list_page.dart';
import 'employee_leave_history_page.dart';
import 'employee_privacy_policy_page.dart';
import 'employee_profile_attendancereport_page.dart';
import '../profile_menu.dart';
import '../profile_pic.dart';
import 'employee_terms_condition_page.dart';
import 'login_page.dart';

class EmployeeProfilePage extends StatefulWidget {
  const EmployeeProfilePage({Key? key}) : super(key: key);
  @override
  EmployeeProfile createState() => EmployeeProfile();

}

class EmployeeProfile extends State<EmployeeProfilePage>{
  String firstName = "";
  String lastName = "";
  bool tappedYes = false;

  Future<UserModel?> getData()async{
      var userDetails = await SessionManager.getUserInfo();
      firstName = userDetails?.firstName ?? '';
      lastName = userDetails?.lastName ?? '';
      return UserModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(AppbarTitleString.myProfile,
            style: AppTextStyle.blackBoldfont,
          ),
        ),
      body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ProfilePic(),
          const SizedBox(height: 5),
          ProfileMenu(
            text: ProfileMenuString.attendanceReports,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EmployeeReportPage()),
              );
            },
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
                thickness: 0.2,
                color: AppColor.black,
              ),
          ),
          ProfileMenu(
            text: ProfileMenuString.leaveRequest,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const LeaveHistoryPage()),
              );
              },
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.2,
              color: AppColor.black,
            ),
          ),
          ProfileMenu(
            text: ProfileMenuString.holidayList,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HolidayPage()),
              );
            },
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.2,
              color: AppColor.black,
            ),
          ),
          ProfileMenu(
            text: ProfileMenuString.salary,
            press: () {},
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.2,
              color: AppColor.black,
            ),
          ),
          ProfileMenu(
            text: ProfileMenuString.changePassword,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const ChangePasswordPage()),
              );
            },
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.2,
              color: AppColor.black,
            ),
          ),
          ProfileMenu(
            text: ProfileMenuString.aboutUs,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const EmployeeAboutUsPage()),
              );
            },
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.2,
              color: AppColor.black,
            ),
          ),
          ProfileMenu(
            text: ProfileMenuString.termsCondition,
            press: ()  {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const TermsAndConditionPage()),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.2,
              color: AppColor.black,
            ),
          ),
          ProfileMenu(
            text: ProfileMenuString.privacyPolicy,
            press: ()  {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const PrivacyPolicyPage()),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.2,
              color: AppColor.black,
            ),
          ),
          ProfileMenu(
            text: ProfileMenuString.singOut,
            press: () async {
            final action =await AlertDialogs.yesCancelDialog(context, 'Logout' , 'are you sure for Logout your account ?');
            if (action == DialogsAction.yes){
              setState(() => tappedYes = true);
              SessionManager.logoutUser();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              const LoginPage()), (Route<dynamic> route) => false);
            }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.2,
              color: AppColor.black,
            ),
          ),
        ],
      ),
    )
    );
  }
}
