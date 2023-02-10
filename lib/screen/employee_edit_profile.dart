import 'package:attendance_manager/all_string.dart';
import 'package:attendance_manager/app_manage.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  EditProfile createState() => EditProfile();
}
class EditProfile extends State<EditProfilePage> {
  double screenHeight = 0;
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(AppbarTitleString.editProfile,
          style: AppTextStyle.blackBoldfont
        ),
      ),
      body: Center(
      child: SingleChildScrollView(
        child:Column(
          children: [
            SizedBox(
          height: 150,
          width: 150,
          child: Stack(fit: StackFit.expand, children: [
             const Positioned(
              right: 20,
              top: 0,
              bottom: 10,
              left: 0,
              child: CircleAvatar(
                backgroundImage: AssetImage("lib/images/user.jpg"),
                radius: 75,
              ),
            ),
            Positioned(
                right: 15,
                bottom: 10,
                child: SizedBox(
                    height: 46,
                    child: IconButton(
                      color: AppColor.grey,
                      icon:  Icon(Icons.camera_alt,color:AppColor.blue),
                      onPressed: () {},
                    )
                )
            )]
          ),
        ),
            const SizedBox(height: 40),
            getTextAreaWidget(),
          ]),
            )
          )
    );
  }

  Widget getTextAreaWidget({Icon? icon,String? labelText,String? value}){
    return  Column(
      children: [
        Row(
          children: [
             Padding(
                padding:  const EdgeInsets.all(8.0),
                child: icon ?? const Icon(Icons.person,size: 30,color: Colors.grey,)
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      labelText ?? "Name",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColor.grey,
                      ),
                    ),
                    Text(
                      value ?? "Krunal patel",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColor.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon:  icon ?? const Icon(Icons.edit,color: Colors.blue),
                alignment: Alignment.topRight,
                onPressed: () {
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Divider(
            thickness: 0.2,
            color: AppColor.black,
          ),
        ),
        Row(
          children: [
            Padding(
                padding:  const EdgeInsets.all(8.0),
                child: icon ?? const Icon(Icons.error_outline,size: 30,color: Colors.grey,)
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      labelText ?? "About",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColor.grey,
                      ),
                    ),
                    Text(
                      value ?? "Flutter Developer",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColor.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon:  icon ?? const Icon(Icons.edit,color: Colors.blue),
                alignment: Alignment.topRight,
                onPressed: () {
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Divider(
            thickness: 0.2,
            color: AppColor.black,
          ),
        ),
        Row(
          children: [
            Padding(
                padding:  const EdgeInsets.all(8.0),
                child: icon ?? const Icon(Icons.phone,size: 30,color: Colors.grey,)
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      labelText ?? "Phone Number",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColor.grey,
                      ),
                    ),
                    Text(
                      value ?? "1234567896",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColor.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Divider(
            thickness: 0.2,
            color: AppColor.black,
          ),
        ),
        Row(
          children: [
            Padding(
                padding:  const EdgeInsets.all(8.0),
                child: icon ?? const Icon(Icons.mail,size: 30,color: Colors.grey,)
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      labelText ?? "Email",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColor.grey,
                      ),
                    ),
                    Text(
                      value ?? "Krunalpatel111@gmail.com",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColor.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Divider(
            thickness: 0.2,
            color: AppColor.black,
          ),
        ),
        ]
    );
  }
}