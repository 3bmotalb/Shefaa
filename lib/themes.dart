// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle = const TextStyle(
    color: Color(0xFF002536), fontSize: 25, fontWeight: FontWeight.bold);

/////////////////////////////////////
const Color DarkBlue = Color(0xFF002536);

const Color PrimaryColor = Color(0xFF5C7894);
const Color SecondColor = Color(0xFF89A3B2);

const Color LightGrey = Color(0xFFD2D4D6);
const Color LightGrey0 = Color(0xFFF2F2F2);
const Color DarkGrey = Color(0xFF525252);
const Color Blue = Color(0xFF93B5C6);
////////////////////////////////////////////////

const Color LightTeal = Color(0xFFB2D3BE);
const Color Biege = Color(0xFFF2F4D1);

//////////chat
const kMessagesCollections = 'message';
const kMessage = 'message';
const kCreatedAt = 'createdAt';

// main colors of APP
const Color bluishClr = Color(0xFF4e5ae8);
const Color white = Color(0xFFFFFFFF);
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF282828);

//colors of medicines
const Color capsule = Color(0xFF264653);
const Color cream = Color(0xFF2a9d8f);
const Color drops = Color(0xFFe9c46a);
const Color pills = Color(0xFFf4a261);
const Color syringe = Color(0xFFe76f51);
const Color syrup = Color(0xFFae2012);

class Themes {
  static final light = ThemeData(
      backgroundColor: Colors.white,
      primaryColor: primaryClr,
      brightness: Brightness.light,
      fontFamily: 'Amiri');

  static final dark = ThemeData(
      backgroundColor: darkGreyClr,
      primaryColor: darkGreyClr,
      brightness: Brightness.dark,
      fontFamily: 'Amiri');
}

//textstyles

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
  ));
}

TextDirection get arabictext {
  if (Get.locale == const Locale('ar')) {
    return TextDirection.rtl;
  } else {
    return TextDirection.ltr;
  }
}

TextStyle get HeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.white : Colors.black,
  ));
}

TextStyle get ButtonTextStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ));
}

TextStyle get TitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Get.isDarkMode ? Colors.white : Colors.black,
  ));
}

TextStyle get SubTitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
  ));
}
Color? get ContainerClr{
 if( Get.isDarkMode ) {
   return
     Colors.grey[100];
 }
 return null;
}

TextStyle get NoTheme {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    // fontSize: 14,
    // fontWeight: FontWeight.w400,
    color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
  ));
}

/////////////////////////////////////////////////
TextStyle get SignTitles {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? DarkBlue : DarkBlue,
  ));
}

////////////////////////////////////
enum GridType {
  staggered,
  masonry,
  quilted,
  woven,
  staired,
  aligned,
}
