import 'package:attendance_manager/app_manage.dart';
import 'package:flutter/material.dart';

class HolidayPage extends StatefulWidget {
  const HolidayPage({Key? key}) : super(key: key);

  @override
  HolidayPageDesign createState() => HolidayPageDesign();
}

class HolidayPageDesign extends State<HolidayPage> {

  final List<Map<String, dynamic>> _allUsers = [
    {"name": "Maha Shivaratri", "date": "18-02-2023"},
    {"name": "Makar Sankranti", "date": "19-02-2023"},
    {"name": "Good Friday", "date": "20-02-2023"},
    {"name": "Mahavir Jayanti", "date": "21-02-2023"},
    {"name": "Holi", "date": "22-02-2023"},
    {"name": "Navratri", "date": "23-02-2023"},
    {"name": "Diwali", "date": "24-02-2023"},
    {"name": "New Year", "date": "25-02-2023"},
    {"name": "Bhai bij", "date": "26-02-2023"},
    {"name": "Holi", "date": "27-02-2023"},
    {"name": "Diwali", "date": "28-02-2023"},
    {"name": "Maha Shivaratri", "date": "29-02-2023"},
    {"name": "Good Friday", "date": "30-02-2023"},
    {"name": "Holi", "date": "31-02-2023"},
    {"name": "Diwali", "date": "1-03-2023"},
  ];

  List<Map<String, dynamic>> _foundUsers = [];

  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Text('Holiday List',
            style: AppTextStyle.blackBoldfont
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundUsers[index]["id"]),
                  elevation: 4,
                  //margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    trailing: Container(
                      color: AppColor.deepPurple,
                      width: 10.0,
                      height: double.maxFinite,
                    ),
                  title:Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(_foundUsers[index]['name'], style:AppTextStyle.blackBoldfont
                      ),
                  ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                          _foundUsers[index]["date"].toString(),style: TextStyle(
                          color:AppColor.black
                      )),
                    ),
                  ),
                ),
              )
                  :  Text(
                'No results found',
                style: AppTextStyle.simplefont24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}