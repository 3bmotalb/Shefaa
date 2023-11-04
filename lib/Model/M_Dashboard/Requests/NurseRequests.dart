// ignore_for_file: unused_import, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_nurse/nurse_model.dart';
import 'package:graduation_project/Screens/UI_Nurse_Service/Profile.dart';

import '../../../themes.dart';

class NurRequestsModel extends StatelessWidget {
  NurseModel nurse;
  NurRequestsModel({Key? key, required this.nurse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Get.to(Profile(
          nurse: nurse,
          isadmin: true,
        ));
      },
      child: Container(
        margin: EdgeInsets.all(w * .01),
        padding: EdgeInsets.all(w * .001),
        height: h * .15,
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
                backgroundColor: Colors.white70,
                backgroundImage: NetworkImage(nurse.image!)),
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(w * .02),
                  alignment: Alignment.topCenter,
                  child: Text(nurse.full_name!)),
            ),
            IconButton(
                onPressed: () {
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
                          acceptnurse(nurse.userid!);
                          Get.back();
                        },
                      ),
                    ],
                  );
                },
                icon: const Icon(Icons.check_circle),
                color: const Color.fromARGB(255, 18, 199, 51),
                iconSize: w * .12),
            IconButton(
                onPressed: () {
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
                          deletenurse(
                              nurse.userid!, nurse.email!, nurse.password!);
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

  void acceptnurse(String userid) async {
    await FirebaseFirestore.instance
        .collection('nurse')
        .doc(userid)
        .update({'status': true});
  }

  void deletenurse(String userid, String email, String password) async {
    UserCredential? userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    userCredential.user!.delete().then((_) async {
      await FirebaseFirestore.instance.collection('nurse').doc(userid).delete();
    });
  }
}
