// ignore_for_file: deprecated_member_use, unnecessary_const, unused_import, duplicate_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_project/Screens/UI_Doctor_Services/AppList_Doctor.dart';
import 'package:graduation_project/Screens/UI_Doctor_Services/Comments_Doctor.dart';
import 'package:graduation_project/Screens/UI_Home/Drawer.dart';
import 'package:graduation_project/Screens/UI_Home/MainScreen.dart';
import 'package:graduation_project/themes.dart';
import '../../DB/Models/M_doctor/doctorcontroller.dart';
import '../../main.dart';
import 'Profile_Doctor.dart';
import 'package:flutter/material.dart';
import 'addapp_Doctor.dart';
import 'package:get/get.dart';
import 'package:graduation_project/themes.dart';
import 'apptab-Doctor.dart';

class HomePage2_d extends StatelessWidget {
  final doctorcontroller = Get.put(DoctorController());

  HomePage2_d({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return doctorcontroller.obx(
      (state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF5C7894),
            title: Text(
              '_homepage'.tr,
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 5),
            // Container(
            //   padding: const EdgeInsets.all(4.0),
            //   child: Text(
            //     "Hello Dr/${doctorcontroller.doctor!.full_name}",
            //     style:
            //         const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //   ),
            // ),
            Expanded(
              child: Container(
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
                                Get.to(Profile_D(
                                  doctor: doctorcontroller.doctor!,
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
                                Get.to(const AddApp2_D());
                                // appcontroller
                                //     .addappoitment(FirebaseAuth.instance.currentUser!.uid);
                              },
                              icon: const Icon(Icons.add)),
                          Text(
                            '_AddconsulationSchedule'.tr,
                            style: TitleStyle,
                            textAlign: TextAlign.center,
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
                                Get.to(apptab_D());
                                // appcontroller
                                //     .addappoitment(FirebaseAuth.instance.currentUser!.uid);
                              },
                              icon: const Icon(Icons.timer)),
                          Text(
                            '_Appointments'.tr,
                            style: TitleStyle,
                            textAlign: TextAlign.center,
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
                                  doctorid:
                                      FirebaseAuth.instance.currentUser!.uid,
                                ));
                              },
                              icon: const Icon(Icons.add_comment_outlined)),
                          Text(
                            '_CommentsAndRating'.tr,
                            style: TitleStyle,
                            textAlign: TextAlign.center,
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
                  ],
                ),
              ),
            ),
          ]),
        );
      },
      onLoading: const Scaffold(
        body: const Center(
          child: const CircularProgressIndicator(),
        ),
      ),
      onEmpty: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Your data is currently checked'),
              const Text('Please wait for the data to be checked'),
              MaterialButton(
                color: Colors.blue,
                onPressed: () async {
                  box.write('login', false);
                  box.remove('type');
                  await FirebaseAuth.instance.signOut();

                  Get.offAll(drawer(const MainHome()));
                },
                child: const Text('Logout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
