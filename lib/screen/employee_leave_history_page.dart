import '../strings.dart';
import 'package:attendance_manager/app_manage.dart';
import 'package:flutter/material.dart';

import 'employee_leave_page.dart';

class LeaveHistoryPage extends StatefulWidget {

  const LeaveHistoryPage({super.key});
  @override
  LeaveHistory createState() => LeaveHistory();
}

class LeaveHistory extends State<LeaveHistoryPage> {

  List<Field> leaveDetails = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(AppbarTitleString.leaveRequest, style: AppTextStyle.blackBoldfont,),
        actions: <Widget>[
           IconButton(
             alignment: Alignment.center,
             padding:  const EdgeInsets.all(0.0),
              icon: const Icon(
                Icons.add_circle_outlined,
                color: Colors.black,
                size: 45,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LeaveRequestPage()),
                );
              },
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 100 ,vertical: 300),
        child: Column(
          children: [
            leaveDetails.isEmpty
                ? Text(
             TextString.noLeavesYet,
              style: const TextStyle(fontSize: 22),
            )
                : SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: leaveDetails.length,
                itemBuilder: (context, index) => getRow(index),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget getRow(int index) {
    return Card(
      child: ListTile(
        // leading: CircleAvatar(
        //   backgroundColor:
        //   index % 2 == 0 ? AppColor.deepPurpleAccent : AppColor.purple,
        //   foregroundColor: Colors.white,
        //   child: Text(leaveDetails[index].title[0],
        //     style: AppTextStyle.boldfont,
        //   ),
        // ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${leaveDetails[index].title}',style: AppTextStyle.boldfont,),
            Text('From Date: ${leaveDetails[index].toDate}'),
            Text('To Date: ${leaveDetails[index].toDate}'),
            Text('Reason: ${leaveDetails[index].reason}'),
          ],
        ),
      ),
    );
  }
}

