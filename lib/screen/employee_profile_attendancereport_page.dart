// ignore_for_file: avoid_unnecessary_containers

import 'package:attendance_manager/app_manage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../strings.dart';

class EmployeeReportPage extends StatefulWidget {
  const EmployeeReportPage({Key? key}) : super(key: key);
  @override

  Attendance createState() => Attendance();

}
class User{
  String date, day;
  User({required this.date, required this.day});
}
class Attendance extends State<EmployeeReportPage>{
  double screenHeight = 0;
  double screenWidth = 0;
  List<User> users = [
    User(date: "17-Jan-2023", day: "Monday"),
    User(date:"16-Jan-2023", day: "Tuesday"),
    User(date:"15-Jan-2023", day:"Wednesday"),
    User(date: "14-Jan-2023", day:"Thursday"),
    User(date: "13-Jan-2023", day: "Friday"),
    User(date:"12-Jan-2023", day: "Saturday"),
    User(date:"11-Jan-2023", day:"Sunday"),
  ];

  DateTime dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value){
      setState(() {
        dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context){
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          title: Text(AppbarTitleString.report,
            style: TextStyle(
                color: AppColor.black
            ),),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
              color: AppColor.black,
            ),
          ],
        ),
        body: Container(
            child: SingleChildScrollView(
                child:Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 2),
                        height: screenHeight / 13,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: (){
                                //action coe when button is pressed
                              },
                              icon: const Icon(Icons.person_pin,size: 40,),
                            ),
                             Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(text: TextString.employeeName,
                                      style: AppTextStyle.boldfont20
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 2),
                        height: screenHeight / 13,
                        decoration: BoxDecoration(
                          color: AppColor.grey200,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:  [
                            Icon(Icons.calendar_month_rounded, size: 24 ,color:AppColor.blue,),
                            Row(
                              children: [
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: AppColor.transparent),
                                  ),
                                  onPressed: _showDatePicker,
                                  child: Text(DateFormat('1 MMM \n yyyy').format(DateTime.now()),
                                    style: const TextStyle(fontSize: 19),
                                  ),
                                ),
                              ],
                            ),
                            const Text('-- To --'),
                            Icon(Icons.calendar_month_rounded, size: 24 ,color:AppColor.blue,),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: AppColor.transparent),
                              ),
                              onPressed: _showDatePicker,
                              child: Text(DateFormat('dd MMM \n yyyy ').format(DateTime.now()),
                                style: const TextStyle(fontSize: 19),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(top: 2),
                        height: screenHeight / 5,
                        width: 340,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.grey,
                              blurRadius: 5.0,
                              offset: const Offset(2,2),
                            )
                          ],
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(
                          children: [
                            Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(text: ' --- Working Hours Details ---', style: AppTextStyle.boldfont25,)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: users.map((userone){
                          return Container(
                            margin: const EdgeInsets.all(3),
                            //height: screenWidth / 5,
                            width: screenWidth / 1.1,
                            //color: Colors.green[100],
                            child: ListTile(
                              trailing: const Icon(Icons.keyboard_arrow_down_rounded,size: 24,),
                              // shape: RoundedRectangleBorder(
                              //     side: const BorderSide(color: Colors.grey,width: 2),
                              //     borderRadius: BorderRadius.circular(20)
                              // ),
                              title: Text(userone.date),
                              subtitle: Text(userone.day),
                            ),
                          );
                        }).toList(),
                      )
                    ]
                )
            )
        )
    );
  }

}