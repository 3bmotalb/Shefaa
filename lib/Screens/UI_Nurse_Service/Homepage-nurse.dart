// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_project/DB/Models/M_nurse/nurse_controller.dart';
import 'package:graduation_project/Screens/UI_Home/Drawer.dart';
import 'package:graduation_project/Screens/UI_Home/MainScreen.dart';
import 'package:graduation_project/Screens/UI_Nurse_Service/Profile.dart';
import 'package:graduation_project/Screens/UI_Nurse_Service/addapp.dart';
import 'package:graduation_project/Screens/UI_Nurse_Service/requestAccepted.dart';
import 'package:graduation_project/main.dart';
import 'package:graduation_project/themes.dart';
import 'Requests.dart';
import 'package:flutter/material.dart';
import 'comments.dart';
import 'addapp.dart';
import 'package:get/get.dart';
import 'AppTabs.dart';

class HomePage2 extends StatelessWidget {
  final nursecontroller = Get.put(NurseController());

  HomePage2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return nursecontroller.obx(
      (state) {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            backgroundColor: PrimaryColor,
            title: Text(
              '_homepage'.tr,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.all(5),
            child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[350],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.to(Profile(
                                nurse: nursecontroller.nurse!,
                                isadmin: false,
                              ));
                            },
                            icon: const Icon(Icons.person)),
                        Text(
                          '_MyProfile'.tr,
                          style: TitleStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[350],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.to(const Request());
                            },
                            icon: const Icon(Icons.notifications)),
                        Text(
                          '_Requests'.tr,
                          style: TitleStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[350],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.to(const Requestaccepted());
                            },
                            icon: const Icon(Icons.notification_add)),
                        Text(
                          '_RequestsAccepted'.tr,
                          style: TitleStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[350],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.to(const AddApp());
                              // appcontroller
                              //     .addappoitment(FirebaseAuth.instance.currentUser!.uid);
                            },
                            icon: const Icon(Icons.add)),
                        Text(
                          '_AddconsulationSchedule'.tr,
                          style: TitleStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[350],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.to(const apptab());
                              // appcontroller
                              //     .addappoitment(FirebaseAuth.instance.currentUser!.uid);
                            },
                            icon: const Icon(Icons.timer)),
                        Text(
                          '_Appointments'.tr,
                          style: TitleStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[350],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.to(Comments(
                                nurseid: FirebaseAuth.instance.currentUser!.uid,
                              ));
                            },
                            icon: const Icon(Icons.add_comment_outlined)),
                        Text(
                          '_CommentsAndRating'.tr,
                          style: TitleStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[350],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () async {
                              box.write('login', false);
                              box.remove('type');
                              await FirebaseAuth.instance.signOut();

                              Get.offAll(drawer(const MainHome()));
                            },
                            icon: const Icon(Icons.exit_to_app)),
                        Text(
                          '_Signout'.tr,
                          style: TitleStyle,
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        );
      },
      onLoading: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
