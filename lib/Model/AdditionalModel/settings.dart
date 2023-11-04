// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Model/Home/textFormField.dart';
import 'package:graduation_project/local/locale_controller.dart';
import 'package:graduation_project/themes.dart';

import '../../Screens/UI_Home/Drawer.dart';
import '../../Screens/UI_Medicine/home_page.dart';
import '../../Services/S_Medicine/notification_service.dart';
import '../../Services/S_Medicine/theme_service.dart';

import 'package:graduation_project/Screens/UI_Home/MainScreen.dart';

class MainSettings extends StatefulWidget {
  const MainSettings({Key? key}) : super(key: key);

  @override
  State<MainSettings> createState() => _MainSettingsState();
}

class _MainSettingsState extends State<MainSettings> {
  bool? isloging;
  var notifyhelper;

  @override
  void initState() {
    super.initState();
    //check if ther user loging or not
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      isloging = false;
    } else {
      isloging = true;
    }
    notifyhelper = NotifyHelper();
    theme = Themes();
  }

  bool dark = Get.isDarkMode;

  @override
  Widget build(BuildContext context) {
    MylocaleController locale = Get.put(MylocaleController());
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: ListTileTheme(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(
              radius: w * .2,
              backgroundColor: LightGrey0,

              backgroundImage: const AssetImage(
                "assets/images/Shefaa-logos_transparent.png",
              ),
            ),
            ListTile(
              onTap: () {
                // Get.to(const EditUserProfile());
              },
              leading: const Icon(Icons.account_circle_rounded),
              title: Text('_editProfile'.tr),
            ),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          backgroundColor: Get.isDarkMode ? darkGreyClr : white,
                          actionsOverflowDirection: VerticalDirection.up,
                          actionsAlignment: MainAxisAlignment.start,
                          actions: <Widget>[
                            Column(
                              children: [
                                TxtButton(
                                  txt: "_notificationON".tr,
                                  function: () {
                                    // ThemeServices().switchTheme();
                                    // notifyhelper.displayNotification(
                                    //     title: "Theme changed", body: "Activated mode");
                                    Get.back();
                                  },
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,

                                      color: Get.isDarkMode ? white : darkGreyClr),
                                ),
                                TxtButton(
                                  txt: "_notificationOFF".tr,
                                  function: () {
                                    Get.back();
                                  },
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Get.isDarkMode ? white : darkGreyClr),
                                )
                              ],
                            ),
                          ],
                        ));
              },
              leading: const Icon(Icons.notifications),
              title: Text('_notification'.tr),
            ),
            ListTile(
              onTap: () {
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
                                    Get.offAll(drawer(const MainHome()));
                                  },
                      style: TextStyle(
                          fontWeight: FontWeight.w300,

                          color: Get.isDarkMode ? white : darkGreyClr),),
                                TxtButton(
                                  txt: "_arabic".tr,
                                  function: () {
                                    locale.changeLanguage('ar');
                                    Get.offAll(drawer(const MainHome()));
                                  },
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,

                                      color: Get.isDarkMode ? white : darkGreyClr),                                )
                              ],
                            )
                          ],
                        ));
              },
              leading: const Icon(Icons.language),
              title: Text('_language'.tr),
            ),
// bool dark
            dark
                ? ListTile(
                    onTap: () {
                      ThemeServices().switchTheme();
                      notifyhelper.displayNotification(
                          title: "Theme changed", body: "Activated mode");
                    },
                    trailing: const Icon(
                      Icons.mode_night_outlined,
                      // color: Get.isDarkMode ? darkGreyClr : darkGreyClr,
                    ),
                    leading: const Icon(Icons.lightbulb),
                    title: Text('_themeMode'.tr),
                  )
                : ListTile(
                    onTap: () {
                      ThemeServices().switchTheme();
                      notifyhelper.displayNotification(
                          title: "Theme changed", body: "Activated mode");
                    },
                    trailing: const Icon(
                      Icons.wb_sunny_outlined,
                      // color: Get.isDarkMode ? darkGreyClr : darkGreyClr,
                    ),
                    leading: const Icon(Icons.lightbulb),
                    title: Text('_themeMode'.tr),
                  )
            // isloging == true
            //     ? ListTile(
            //         onTap: () async {
            //           // user log out function
            //           box.write('login', false);
            //           box.remove('type');
            //           await FirebaseAuth.instance.signOut();
            //           setState(() {
            //             isloging = false;
            //           });
            //           Get.to(drawer(const MainHome()));
            //         },
            //         leading: const Icon(Icons.logout),
            //         title: const Text('Log out'),
            //       )
            //     : ListTile(
            //         onTap: () {
            //           Get.to(const SignIn());
            //         },
            //         leading: const Icon(Icons.login_outlined),
            //         title: const Text('Log in'),
            //       ),
            //
          ],
        ),
      ),
    );
  }
}
