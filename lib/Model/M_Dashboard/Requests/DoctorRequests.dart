// ignore_for_file: unused_import, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_doctor/doctormodel.dart';

import '../../../Screens/UI_Nurse_Service/Profile.dart';
import '../../../themes.dart';

class DocRequestsModel extends StatelessWidget {
  DoctorModel doctor;
  DocRequestsModel({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        // Get.to(Profile());
      },
      child: Container(
        margin: EdgeInsets.all(w * .01),
        padding: EdgeInsets.all(w * .001),
        width: w * .9,
        decoration: BoxDecoration(
            color: Get.isDarkMode
                ? DarkGrey.withOpacity(.5)
                : LightGrey0.withOpacity(.7),
            borderRadius: BorderRadius.circular(w * .02)),
        child: Row(
          children: [
            CircleAvatar(
                radius: 40.0,
                // backgroundColor: Colors.white70,
                backgroundImage: NetworkImage(doctor.image!)),
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(w * .02),
                  alignment: Alignment.topCenter,
                  child: Text(doctor.full_name!)),
            ),
            IconButton(
                onPressed: () async {
                  Get.defaultDialog(
                    title: '_Confirm'.tr,
                    middleText: '_confirmNote'.tr,
                    actions: [
                      TextButton(
                        child: Text('_no'.tr),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      ElevatedButton(
                        child: Text('_yes'.tr),
                        onPressed: () async {
                          acceptdoctor(doctor.userid!);
                          Get.back();
                        },
                      ),
                    ],
                  );
                },
                icon: const Icon(Icons.check_circle),
                color: const Color(0xFF6BCB77),
                iconSize: w * .12),
            IconButton(
                onPressed: () async {
                  Get.defaultDialog(
                    title: '_reject'.tr,
                    middleText: '_rejectNote'.tr,
                    actions: [
                      TextButton(
                        child: Text('_no'.tr),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      ElevatedButton(
                        child: Text('_yes'.tr),
                        onPressed: () async {
                          deletedoctor(
                              doctor.userid!, doctor.email!, doctor.password!);
                          Get.back();
                        },
                      ),
                    ],
                  );
                },
                icon: const Icon(Icons.cancel_rounded),
                color: const Color(0xFFB20600),
                iconSize: w * .12)
          ],
        ),
      ),
    );
  }

  void acceptdoctor(String userid) async {
    await FirebaseFirestore.instance
        .collection('doctor')
        .doc(userid)
        .update({'status': true});
  }

  void deletedoctor(String userid, String email, String password) async {
    UserCredential? userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    userCredential.user!.delete().then((_) async {
      await FirebaseFirestore.instance
          .collection('doctor')
          .doc(userid)
          .delete();
    });
  }
}
