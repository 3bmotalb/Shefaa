// ignore_for_file: deprecated_member_use, prefer_typing_uninitialized_variables
import 'package:graduation_project/DB/Models/M_doctor/doctorcontroller.dart';
import 'package:graduation_project/DB/Models/M_doctor/doctormodel.dart';
import 'package:graduation_project/DB/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../themes.dart';

// ignore: must_be_immutable
class Profile_D extends StatelessWidget {
  DoctorModel doctor;
  bool isadmin;
  Profile_D({Key? key, required this.doctor, required this.isadmin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          title: Text(
            '_myprofile'.tr,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 200,
                color: const Color.fromRGBO(255, 255, 255, 1),
                alignment: Alignment.center,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: CircleAvatar(
                            backgroundImage: NetworkImage(doctor.image!)),
                      ),
                      Expanded(
                        child: Column(children: [
                          Text(doctor.full_name!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            "Doctor ${doctor.full_name}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ]),
              ),
              Container(
                  color: Colors.white54,
                  margin: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    Row(children: [
                      const Icon(Icons.home),
                      Text('_Home'.tr,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(": ${doctor.govname}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          )),
                      Row(
                        children: [
                          Text(' - '.tr,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(doctor.cityname!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ))
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.workspace_premium_outlined),
                          Text('_Title'.tr,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          Text("${doctor.title}".tr,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ))
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.cake),
                          Text('_birthday'.tr,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                              ": ${functions().Change_Date_Format(doctor.birthdate!)}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ))
                        ],
                      ),
                    ])
                  ])),
              const SizedBox(height: 10),
              Container(
                  color: Colors.white54,
                  margin: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    Row(
                      children: [
                        const Icon(Icons.email),
                        Text('_Email'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        Text("${doctor.email}".tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ))
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.phone),
                        Text('_Phone'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        Text("${doctor.phone1}".tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ))
                      ],
                    ),
                  ])),
              const SizedBox(height: 10),
              Container(
                  color: Colors.white54,
                  margin: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    Row(
                      children: [
                        const Icon(Icons.work_outlined),
                        Text('_WORKAT'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(": ${doctor.bio}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            )),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.school),
                        Text('_education'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(": ${doctor.education}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ))
                      ],
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        const Icon(Icons.medical_services_outlined),
                        Text('_category'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(": ${doctor.category}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ))
                      ],
                    ),
                  ])),
              const SizedBox(height: 20),
              SizedBox(
                height: h * 0.25,
                width: w * 0.9,
                child: Image.network(doctor.licence!),
              ),
              !isadmin
                  ? Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[350],
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () => {
                                    // Get.to(const Page5())
                                  },
                              icon: const Icon(Icons.person)),
                          Text('_Editprofile'.tr,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.defaultDialog(
                                title: '_Confirm'.tr,
                                middleText: '_confirmNote'.tr,
                                actions: [
                                  FlatButton(
                                    child: Text('_no'.tr),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                  FlatButton(
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
                            color: const Color.fromARGB(255, 18, 199, 51),
                            iconSize: w * .12),
                        IconButton(
                            onPressed: () {
                              Get.defaultDialog(
                                title: '_reject'.tr,
                                middleText: '_rejectNote'.tr,
                                actions: [
                                  FlatButton(
                                    child: Text('_no'.tr),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text('_yes'.tr),
                                    onPressed: () async {
                                      deletedoctor(doctor.userid!,
                                          doctor.email!, doctor.password!);
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
            ],
          ),
        ]));
  }
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
    await FirebaseFirestore.instance.collection('doctor').doc(userid).delete();
  });
}
