// ignore_for_file: file_names, deprecated_member_use, avoid_print
import 'package:attendance_manager/app_manage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../strings.dart';


class EmployeeAboutUsPage extends StatefulWidget {
  const EmployeeAboutUsPage({Key? key}) : super(key: key);
  @override
  AboutUs createState() => AboutUs();

}

class AboutUs extends State<EmployeeAboutUsPage>{
  double screenHeight = 0;
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(AppbarTitleString.aboutUs,
            style: AppTextStyle.blackBoldfont,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 235,bottom: 10,top: 10),
                child: Text('Our Goals', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10,left: 20),
                child: Text(LocalisationString.paragraph,style: const TextStyle(fontSize: 15),),
              ),

                 const Padding(
                   padding: EdgeInsets.only(left: 140),
                   child: Text('CEO - Ravi Vekariya ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                 ),

              Container(
                width: 300,
                height: screenHeight / 2.5,
                margin: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('lib/images/ravibhai.png'),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only (top: 2,right: 10,left: 12),
                    height: screenHeight / 6.5,
                    width: screenWidth / 3.5,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      border: Border.all(
                          color: Colors.grey,
                          width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30,top: 10),
                      child:IconButton(
                        icon: const Icon(Icons.email_rounded,color: Colors.deepPurple,size: 40,),
                        alignment: Alignment.topRight,
                        onPressed: () async {
                          final Uri params = Uri(
                              scheme: 'mailto',
                              path: "sales@evenscript.com"
                          );
                          var url = params.toString();
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        )
                      )
                  ]),
                        Row(
                          children: const[
                            Padding(
                              padding: EdgeInsets.only(left: 30,top: 5),
                              child: Text("E-mail",style: TextStyle(color: Colors.black,fontSize: 15),),
                            ),
                          ],
                        ),
                        Row(
                          children: const[
                            Padding(
                              padding: EdgeInsets.only(left: 5,top: 15),
                              child: Text("evenscript@gmail.com",style: TextStyle(color: Colors.black,fontSize: 9),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2,right: 10,left: 4),
                    height: screenHeight / 6.5,
                    width: screenWidth / 3.5,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      border: Border.all(
                          color: Colors.grey,
                          width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                            children:[
                              Padding(
                                padding: const EdgeInsets.only(left: 25,top: 10),
                                child:IconButton(
                                  icon:  const Icon(Icons.add_call,color: Colors.deepPurple,size: 40,),
                                  alignment: Alignment.topRight,
                                  onPressed: () async {
                                    final Uri url = Uri(
                                      scheme: 'tel',
                                      path: "886 618 1825"
                                    );
                                    if(await canLaunchUrl(url)){
                                    await launchUrl(url);
                                  }else {
                                      print('can not launch number');
                                    }
                                  },
                                ),
                              ),
                            ]),
                        Row(
                          children: const[
                            Padding(
                              padding: EdgeInsets.only(left: 30,top: 5),
                              child: Text("Phone",style: TextStyle(color: Colors.black,fontSize: 15),),
                            ),
                          ],
                        ),
                        Row(
                          children: const[
                            Padding(
                              padding: EdgeInsets.only(left: 15,top: 15),
                              child: Text("+91 1234567891",style: TextStyle(color: Colors.black,fontSize: 9),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2,right: 10,left: 4),
                    height: screenHeight / 6.5,
                    width: screenWidth / 3.5,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      border: Border.all(
                          color: Colors.grey,
                          width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30,top: 10),
                                child: IconButton(
                                  icon:  const Icon(Icons.location_on,color: Colors.deepPurple,size: 40,),
                                  alignment: Alignment.topRight,
                                  onPressed: () {},
                                ),
                              ),
                            ]),
                        Row(
                          children: const[
                            Padding(
                              padding: EdgeInsets.only(left: 22,top: 5),
                              child: Text("Location",style: TextStyle(color: Colors.black,fontSize: 15),),
                            ),
                          ],
                        ),
                        Row(
                          children: const[
                            Padding(
                              padding: EdgeInsets.only(left: 5,top: 10),
                              child: Text("PNTC-D708, Times of \n Ahemdabad, 380015",style: TextStyle(color: Colors.black,fontSize: 9),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

        )
    );
  }
}
