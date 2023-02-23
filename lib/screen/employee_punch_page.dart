// ignore_for_file: unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'package:attendance_manager/app_manage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../models/user_model.dart';
import '../session_manager.dart';
import '../strings.dart';
import 'camerascreen.dart';

class EmployeePunchPage extends StatefulWidget {
  const EmployeePunchPage({Key? key}) : super(key: key);
  @override

  Attendance createState() => Attendance();

}

class Attendance extends State<EmployeePunchPage> {
  double screenHeight = 0;
  double screenWidth = 0;
  String firstName = "";
  String lastName = "";
  String location ='Null, Press Button';
  String Address = 'search';

  @override
  void initState() {
    super.initState();
    _getGeoLocationPosition();
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address = '${place.street}, ${place.subLocality},${place.subLocality}, ${place.locality},\n ${place.postalCode}, ${place.country}';
    setState(()  {
    });
  }

  Future<UserModel?> getData()async{
    var userDetails = await SessionManager.getUserInfo();
    firstName = userDetails?.firstName ?? '';
    lastName = userDetails?.lastName ?? '';
    return UserModel();
  }

    @override
    Widget build(BuildContext context) {
      screenHeight = MediaQuery.of(context).size.height;
      screenWidth = MediaQuery.of(context).size.width;

      return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: AppColor.white,
          centerTitle: true,
          title: Text('${firstName} \n ${lastName}',
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
                onPressed: () async {
                  Position position = await _getGeoLocationPosition();
                  //location ='Lat: ${position.latitude} , Long: ${position.longitude}';
                  GetAddressFromLatLong(position);
                },
              icon: const Icon(Icons.more_vert),
              color: AppColor.black,
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 2),
                  height: screenHeight / 1.8,
                  width: screenWidth,
                  child: const CameraScreen(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38,top: 15),
                child: Row(
                    children: [
                       const Padding(
                         padding: EdgeInsets.only(right: 10),
                         child: Icon(
                          Icons.watch_later_outlined,
                          color: Colors.deepPurple,
                          size: 20.0,),
                       ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: RichText(
                          text: TextSpan(
                            // WidgetSpan(
                            //     child: Icon(Icons.access_time_rounded, color: Colors.purple,)),
                            text: DateTime
                                .now()
                                .day
                                .toString(),
                            style: TextStyle(
                              color: AppColor.black,
                              fontSize: screenWidth / 25,
                            ),
                            children: [
                              TextSpan(
                                text: DateFormat(' MMMM yyyy / ').format(
                                    DateTime.now()),
                                style: TextStyle(
                                  color: AppColor.black,
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
                      ),
                      ]),
              ),
              Container(
                width: 330,
                margin: const EdgeInsets.only(left:35,top: 10),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.location_on,
                            color: Colors.deepPurple,
                            size: 25.0,),
                        ),
                        Text('${Address}',
                          style: AppTextStyle.blackfontMedium17,
                        )
                      ],
                    )
              ),
              Container(
                width: 330,
                margin: const EdgeInsets.only(top: 15),
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
                        onSubmit: () {
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

