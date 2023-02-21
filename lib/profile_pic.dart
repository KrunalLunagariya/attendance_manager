import 'package:attendance_manager/session_manager.dart';
import 'package:flutter/material.dart';
import 'app_manage.dart';
import 'models/user_model.dart';
import 'screen/employee_edit_profile.dart';

class ProfilePic extends StatefulWidget {

   const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  double screenHeight = 0;
  double screenWidth = 0;
  String firstName = "";
  String lastName = "";
  String email = "";

  Future<UserModel?> getData()async{
      var userDetails = await SessionManager.getUserInfo();
      firstName = userDetails?.firstName ?? '';
      lastName = userDetails?.lastName ?? '';
      email = userDetails?.email ?? '';
      return UserModel();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Container(
      // width: screenWidth / 1.1,
      height: screenHeight / 6.5,
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                      backgroundImage: AssetImage("lib/images/user.jpg"),
                    radius: 35,
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                padding: const EdgeInsets.only(top: 8),
                                child: Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(text:'${firstName} ',
                                          style: AppTextStyle.boldfont20),
                                      TextSpan(text:'${lastName}\n',
                                          style: AppTextStyle.boldfont20),
                                      TextSpan(text: email,
                                      style: AppTextStyle.grayfont12 ),
                                    ],
                                  ),
                                ),
                              );
                            };
                          }),

                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: IconButton(
                      icon:  const Icon(Icons.edit,color: Colors.blue),
                      alignment: Alignment.topRight,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  const EditProfilePage()),
                        );
                      },
                    ),
                  ),
              ],
            )
    );

      // height: 100,
      // width: 115,
      // child: Stack(
      //   fit: StackFit.expand,
      //   clipBehavior: Clip.none,
      //   children: const [
      //     CircleAvatar(
      //       backgroundImage: AssetImage("lib/images/user.jpg"),
      //     ),
          // Positioned(
          //   right: -16,
          //   bottom: 0,
          //   child: SizedBox(
          //     height: 46,
          //     width: 46,
          //     child: TextButton(
          //       style: TextButton.styleFrom(
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(30),
          //           side: BorderSide(color: Colors.white),
          //         ),
          //         primary: Colors.white,
          //         backgroundColor: Color(0xFFF5F6F9),
          //       ),
          //       onPressed: () {},
          //       child: Icon(Icons.camera_alt, size: 24 ,color:Colors.deepPurple,),)
          //     ),
          //   ),
  }
}