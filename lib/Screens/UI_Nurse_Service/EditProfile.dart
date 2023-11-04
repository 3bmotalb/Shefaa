import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_nurse/nurse_controller.dart';
import 'package:graduation_project/Model/Home/textFormField.dart';
import 'package:graduation_project/Screens/UI_Home/Drawer.dart';
import 'package:graduation_project/Screens/UI_Medicine/home_page.dart';
import 'package:graduation_project/Screens/UI_Nurse_Service/nursenaviationbar.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/EditProfile.dart';
import 'package:graduation_project/main.dart';
import 'package:graduation_project/themes.dart';
import '../UI_Home/MainScreen.dart';
import 'package:graduation_project/Screens/UI_Nurse_Service/Profile.dart';
import 'updateprofile.dart';

class Account_N extends StatefulWidget {
  const Account_N({Key? key}) : super(key: key);

  @override
  State<Account_N> createState() => _Account_NState();
}

final NurseController nurseController = Get.put(NurseController());

class _Account_NState extends State<Account_N> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Container(
          padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
          child: ListView(
            children: [
              Text(
                "_Welcome".tr,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Text(
                "${nurseController.nurse!.full_name}",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              Text(
                "_nurse".tr,
                style: TextStyle(
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
                Get.to(Updateprofile_N(store: userControler.user));
              }),
              buildAccountoptionRow(context, "_Language".tr, Icons.language,
                  () {
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
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          // content: Text("You have raised a Alert Dialog Box"),
                          actions: <Widget>[
                            Column(
                              children: [
                                TxtButton(
                                  txt: "_english".tr,
                                  function: () {
                                    locale.changeLanguage('en');
                                    Get.offAll(const nursehomepagenavigation());
                                  },
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color:
                                          Get.isDarkMode ? white : darkGreyClr),
                                ),
                                TxtButton(
                                  txt: "_arabic".tr,
                                  function: () {
                                    locale.changeLanguage('ar');
                                    Get.offAll(const nursehomepagenavigation());
                                  },
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color:
                                          Get.isDarkMode ? white : darkGreyClr),
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
