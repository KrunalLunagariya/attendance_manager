// ignore_for_file: avoid_unnecessary_containers, unnecessary_brace_in_string_interps
import 'package:attendance_manager/app_manage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/user_model.dart';
import '../session_manager.dart';
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
  String firstName = "";
  String lastName = "";

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
  initState() {
    super.initState();
    //getUserDetails();
  }

  // void getUserDetails() async {
  //   var userDetails = await SessionManager.getUserInfo();
  //   firstName = userDetails?.firstName ?? '';
  //   print(firstName);
  // }

  Future<UserModel?> getData()async{
      var userDetails = await SessionManager.getUserInfo();
      firstName = userDetails?.firstName ?? '';
      lastName = userDetails?.lastName ?? '';
      return UserModel();
  }

  @override
  Widget build(BuildContext context){
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:  Text(AppbarTitleString.report,
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
                         Column(
                           children: [
                             FutureBuilder(
                               future: getData(),
                               builder: (context, snapshot) {
                                 if (snapshot.connectionState == ConnectionState.waiting) {
                                   return const Center(
                                     child: CircularProgressIndicator(),
                                   );
                                 } else {
                                   return Padding(
                                     padding: const EdgeInsets.only(top: 20),
                                     child: Text.rich(
                                       TextSpan(
                                         children: <TextSpan>[
                                           TextSpan(text:'${firstName} ',
                                               style: AppTextStyle.boldfont20),
                                           TextSpan(text:lastName,
                                               style: AppTextStyle.boldfont20),
                                         ],
                                       ),
                                     ),
                                   );
                                 }
                               })
                           ],
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
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Icon(Icons.calendar_month_rounded, size: 24 ,color:AppColor.blue,),
                        ),
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
                        const Padding(
                          padding: EdgeInsets.only(right: 30,left: 10),
                          child: Text('-- To --',style: TextStyle(fontSize: 20),),
                        ),
                           Icon(Icons.calendar_month_rounded, size: 24 ,color:AppColor.blue,),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: AppColor.transparent),
                          ),
                          onPressed: _showDatePicker,
                          child: Text(DateFormat('dd MMM \n yyyy ').format(DateTime.now()),
                            style: AppTextStyle.simplefont19,
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
                      color: AppColor.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.grey,
                          blurRadius: 5.0,
                          offset: const Offset(2,2),
                        )
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children:[
                               const Padding( padding: EdgeInsets.only(left: 10,top: 5),
                              child: Text("Summary ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                               ),
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: Text(" till ${DateTime.now().day.toString()}"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: Text(DateFormat(' - MMMM - yyyy ').format(DateTime.now())),
                              )
                            ],
                          ),
                      Divider(
                        thickness: 0.8,
                        color: AppColor.grey,
                      ),
                          const SizedBox(height: 5),
                          Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:const [
                          Text("PRESENT DAYS",style: TextStyle(color: Colors.grey),),
                          Text("WORK HOURS",style: TextStyle(color: Colors.grey),),
                          Text("ABSENT DAYS",style: TextStyle(color: Colors.grey),)
                        ],
                      ),

                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const[

                            Text("0 Days",style: TextStyle(color: Colors.green,fontSize: 18),),
                            Text("00h 00m",style: TextStyle(color: Colors.green,fontSize: 18),),
                            Text("13days",style: TextStyle(color: Colors.red,fontSize: 18),)
                          ],
                        ),
                          const SizedBox(height: 15),
                          Row(
                          children:const [
                               Padding(
                                 padding: EdgeInsets.only(left: 10),
                                 child: Text("DAYS WORKED",style: TextStyle(color: Colors.grey),),
                               ),
                               Padding(
                                 padding: EdgeInsets.only(left: 80),
                                 child: Text("HRS WORKED",style: TextStyle(color: Colors.grey)),
                               ),
                          ],
                      ),
                         Row(
                          children: const[
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text("2 Days",style: TextStyle(color: Colors.deepPurple,fontSize: 18),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 110),
                              child: Text("00h 00m",style: TextStyle(color: Colors.deepPurple,fontSize: 18),),
                            )
                          ],),

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