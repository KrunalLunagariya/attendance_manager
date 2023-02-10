import 'package:flutter/material.dart';
class AppColor {
  static Color black = Colors.black;
  static Color black26 = Colors.black26;
  static Color white = Colors.white;
  static Color blue = Colors.blue;
  static Color transparent = Colors.transparent;
  static Color? grey200 = Colors.grey[200];
  static Color grey = Colors.grey;
  static Color purple = Colors.purple;
  static Color deepPurple = Colors.deepPurple;
  static Color deepPurpleAccent = Colors.deepPurpleAccent;
}

class AppTextStyle {
  static TextStyle simplefont19 = const TextStyle(fontSize: 19);
  static TextStyle simplefont16 = const TextStyle(fontSize: 16);
  static TextStyle simplefont24 = const TextStyle(fontSize: 24);
  static TextStyle blackfontMedium17 = const TextStyle(fontSize: 17);
  static TextStyle boldfont20 = const TextStyle(fontWeight: FontWeight.bold,fontSize: 20);
  static TextStyle blackfont20 = const TextStyle(fontSize: 20,color: Colors.black);
  static TextStyle blackfont24 = const TextStyle(fontSize: 24,color: Colors.black);
  static TextStyle blackfont14 = const TextStyle(fontSize: 14,color: Colors.black);
  static TextStyle blackfont15 = const TextStyle(fontSize: 15,color: Colors.black);
  static TextStyle blackfont16 = const TextStyle(fontSize: 16,color: Colors.black);
  static TextStyle bluefont15 = const TextStyle(fontSize: 15,color: Colors.blue);
  static TextStyle deepPurplefontbold50 = const TextStyle(fontSize: 50,color: Colors.deepPurple, fontWeight: FontWeight.bold,);
  static TextStyle boldfont25 = const TextStyle(fontWeight: FontWeight.bold,fontSize: 25);
  static TextStyle blackcolor = TextStyle(color: AppColor.black);
  static TextStyle whiteBoldfont = const TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle boldfont = const TextStyle(fontWeight: FontWeight.bold);
  static TextStyle blackBoldfont = const TextStyle(fontWeight: FontWeight.bold, color: Colors.black);

}

class FontMaths {
  double screenHeight = 0;
  double screenWidth = 0;
  double getFontSize(double fontSize){
    return fontSize * (screenWidth/414);
  }
}