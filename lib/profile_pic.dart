import 'package:flutter/material.dart';
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
                    children: const [
                      Text(
                          "Krunal Patel",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),

                      Text(
                          "lunagariyakrunal26@gmail.com",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 12,
                            color: Colors.grey,

                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
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