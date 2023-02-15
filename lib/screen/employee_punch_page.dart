import 'package:attendance_manager/app_manage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../strings.dart';

class EmployeePunchPage extends StatefulWidget {
  const EmployeePunchPage({Key? key}) : super(key: key);
  @override

  Attendance createState() => Attendance();

}

class Attendance extends State<EmployeePunchPage>{
  double screenHeight = 0;
  double screenWidth = 0;


  @override
  Widget build(BuildContext context){
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: AppColor.white,
        centerTitle: true,
        title: Text(AppbarTitleString.employeeName,
        style: TextStyle(
            color: AppColor.black
        ),),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.home),
          color: AppColor.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
            color: AppColor.black,
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 2),
              height: screenHeight / 2,
              decoration: BoxDecoration(
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.black26,
                    blurRadius: 10,
                    offset: const Offset(2,2),
                  )
                ],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child:Column(
                        children: [
                          Text(
                            "Camera part",
                            style:AppTextStyle.blackfont20,
                          )
                        ],
                      )
                  ),
                ],
              )
            ),
            Padding(
              padding: EdgeInsets.only(left:80),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: RichText(
                      text: TextSpan(
                        // WidgetSpan(
                        //     child: Icon(Icons.access_time_rounded, color: Colors.purple,)),
                        text: DateTime.now().day.toString(),
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: screenWidth / 25,
                        ),
                        children: [
                          TextSpan(
                          text: DateFormat(' MMMM yyyy / ').format(DateTime.now()),
                          style: TextStyle(
                        color:  AppColor.black,
                        fontSize: screenWidth / 25,
                      ),
                    ),
                        ],
                      ),
                    ),
                  ),
                  StreamBuilder(
                    stream: Stream.periodic(const Duration(seconds: 1)),
                    builder: (context, snapshot) {
                      return Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          DateFormat('hh:mm:ss a').format(DateTime.now()),
                          style: TextStyle(
                            fontSize: screenWidth / 25,
                            color: AppColor.black,
                          ),
                        ),
                      );
                    }
                  )
    ]),
            ),

            Container(
              width: 330,
              margin: const EdgeInsets.only(top: 30),
              child: Builder(
                builder: (context) {
                  final GlobalKey<SlideActionState> key = GlobalKey();
                  return SlideAction(
                    text: SlideButtonString.checkIn,
                    textStyle: TextStyle(
                      color: AppColor.white,
                      fontSize: screenWidth / 20,
                    ),
                    outerColor: AppColor.deepPurple,
                    innerColor: AppColor.white,
                    key: key,
                    onSubmit: (){
                        key.currentState!.reset();
                    },
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

