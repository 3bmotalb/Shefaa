// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_doctor/doctorcontroller.dart';
import 'package:graduation_project/DB/Models/M_user/usercontroler.dart';
import 'package:graduation_project/Model/Home/textFormField.dart';
import 'package:graduation_project/Screens/UI_Doctor_Services/HomePage_Doctor.dart';
import 'package:graduation_project/Screens/UI_Doctor_Services/Updatep-D.dart';
import 'package:graduation_project/Screens/UI_Doctor_Services/doctornaviationbar.dart';
import 'package:graduation_project/Screens/UI_Home/Drawer.dart';
import 'package:graduation_project/Screens/UI_Medicine/home_page.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/nurse_booking.dart';
import 'package:graduation_project/main.dart';
import 'package:graduation_project/themes.dart';

import '../UI_Home/MainScreen.dart';

class Account_D extends StatefulWidget {
  const Account_D({Key? key}) : super(key: key);

  @override
  State<Account_D> createState() => _Account_DState();
}

final DoctorController doctorController = Get.put(DoctorController());

class _Account_DState extends State<Account_D> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
      child: ListView(
        children: [
          Text(
            "_Welcome".tr,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          Text(
            "Dr".tr + "${doctorController.doctor!.full_name}",
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          Text(
            "${doctorController.doctor!.title}".tr,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 15,
            thickness: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          buildAccountoptionRow(context, "_Account".tr, Icons.person, () {
            Get.to(Updateprofile_D(store: userControler.user));
          }),
          buildAccountoptionRow(context, "_Language".tr, Icons.language, () {
            showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                      backgroundColor: Get.isDarkMode ? darkGreyClr : white,
                      actionsOverflowDirection: VerticalDirection.up,
                      actionsAlignment: MainAxisAlignment.start,

                      title: Text(
                        "_chooseLanguage".tr,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black),
                      ),
                      // content: Text("You have raised a Alert Dialog Box"),
                      actions: <Widget>[
                        Column(
                          children: [
                            TxtButton(
                              txt: "_english".tr,
                              function: () {
                                locale.changeLanguage('en');
                                Get.offAll(const doctorhomepagenavigation());
                              },
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Get.isDarkMode ? white : darkGreyClr),
                            ),
                            TxtButton(
                              txt: "_arabic".tr,
                              function: () {
                                locale.changeLanguage('ar');
                                Get.offAll(const doctorhomepagenavigation());
                              },
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Get.isDarkMode ? white : darkGreyClr),
                            )
                          ],
                        )
                      ],
                    ));
          }),
          const Divider(
            height: 15,
            thickness: 2,
          ),
          buildAccountoptionRow(context, "_Rate".tr, Icons.star, () {}),
          buildAccountoptionRow(context, "_About".tr, Icons.book, () {}),
          buildAccountoptionRow(
            context,
            "_Logout".tr,
            Icons.logout,
            () async {
              box.write('login', false);
              box.remove('type');
              await FirebaseAuth.instance.signOut();

              Get.offAll(drawer(const MainHome()));
            },
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    ));
  }

  GestureDetector buildAccountoptionRow(
      BuildContext context, String title, IconData icon, Function onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
