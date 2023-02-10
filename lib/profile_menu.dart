// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'app_manage.dart';


class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback? press;
  final String assetName = 'lib/images/arrow-right-rounded-svgrepo-com.svg';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: TextButton(
        style: TextButton.styleFrom(
            fixedSize: const Size.fromHeight(40),
         primary: Colors.black
        ),
        onPressed: press,
        child: Row(
          children: [
            const SizedBox(width: 20),
            Expanded(child: Text(text,style: AppTextStyle.blackfontMedium17,)),
            //const Icon(Icons.arr,size: 28,color: Colors.black26,),
          SvgPicture.asset(
            assetName,
            height: 24,
            width: 24,
          )
          ],
        ),
      ),
    );
  }
}