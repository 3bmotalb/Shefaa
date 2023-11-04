// ignore_for_file: file_names, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation_project/Screens/Additional/Report%20a%20problem.dart';
import 'package:graduation_project/Screens/Additional/UI_ToDo/notes_list.dart';
import 'package:graduation_project/Screens/UI_Dashboard/DashMainHome.dart';
import 'package:graduation_project/main.dart';
import 'package:graduation_project/themes.dart';
import '../../Screens/Additional/Settings.dart';
import '../../Screens/UI_Home/Drawer.dart';
import '../../Screens/UI_Home/MainScreen.dart';
import '../../Screens/UI_Sign/SignIn.dart';
import '../Home/Buttons.dart';
class DrawerItems extends StatefulWidget {
  const DrawerItems({Key? key}) : super(key: key);

  @override
  State<DrawerItems> createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {

  @override
  Widget build(BuildContext context) {



    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return ListTileTheme(
      child: Column(
        children: [
          SizedBox(height: h*.1,),
      //application LOGO
      CircleAvatar(
            radius: w * .17,
            backgroundColor: LightGrey0,
            backgroundImage: const AssetImage(
              "assets/images/Shefaa-logos_transparent.png",
            ),
          ),
          // Text("_applicationName".tr),
          // ListTile(
          //   // minLeadingWidth: w*.3,
          //   leading: CircleAvatar(
          //     radius: w * .11,
          //     backgroundImage: const AssetImage(
          //       "assets/images/Penguin.png",
          //     ),
          //   ),
          //   title: Text("_userName".tr),
          //   subtitle: const Text(
          //     "namee11@gmail.com",
          //     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
          //   ),
          //   contentPadding: EdgeInsets.only(
          //       bottom: h * .01,
          //       left: w * .000001,
          //       right: w * .000001,
          //       top: h * .15),
          //
          //   trailing: IconButton(
          //     icon: const Icon(
          //       Icons.edit,
          //     ),
          //     onPressed: () {
          //       // Get.to(const EditUserProfile());
          //     },
          //   ),
          // ),
          Divider(
            color: Get.isDarkMode ? white : darkGreyClr,
            thickness: 1,
            indent: w * .1,
            endIndent: w * .001,
          ),
          
          ListTile(
            onTap: () {
              Get.to(const Settings());
            },
            leading: const Icon(Icons.settings),
            title: Text('_settings'.tr),
          ),
          ListTile(
            onTap: () {
              Get.to(const NoteList());
              // Get.to(const Settings());
            },
            leading: const Icon(Icons.note_sharp),
            title: Text('_addNotes'.tr),
          ),
          box.read('login') == true
              ? ListTile(
                  onTap: () async {
                    // user log out function
                    box.write('login', false);
                    box.remove('type');
                    await FirebaseAuth.instance.signOut();
                    
                    Get.to(drawer(const MainHome()));
                  },
                  leading: const Icon(Icons.logout),
                  title: Text('_logOut'.tr),
                )
              : ListTile(
            onTap: () {
                    Get.to(const SignIn());
                  },
                  leading: const Icon(Icons.login_outlined),
                  title: Text('_logIn'.tr),
                ),
          const Spacer(),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.black,
            thickness: 1,
            indent: w * .1,
            endIndent: w * .1,
          ),
          ListTile(
            onTap: () {
              Get.to(const ReportAProblem());
            },
            leading: const Icon(Icons.report_problem_outlined),
            title: Text('_reportAProblem'.tr),
          ),
        ],
      ),
    );
  }
}
