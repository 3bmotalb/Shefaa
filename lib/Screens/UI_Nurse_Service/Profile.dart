// ignore_for_file: deprecated_member_use, prefer_typing_uninitialized_variables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_project/DB/Models/M_nurse/nurse_model.dart';
import 'package:graduation_project/DB/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  NurseModel nurse;
  bool isadmin;
  Profile({Key? key, required this.nurse, required this.isadmin})
      : super(key: key);

  var A;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
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
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(nurse.image!)),
                        ),
                      ),
                      Expanded(
                        child: Column(children: [
                          Text(nurse.full_name!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            '_Nurse'.tr,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                        ]),
                      ),
                    ]),
              ),
              Container(
                  color: Colors.white54,
                  margin: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    Row(
                      children: [
                        const Icon(Icons.home),
                        Text('_Home'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(": ${nurse.govname}",
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
                            Text(nurse.cityname!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                )),
                          ],
                        )
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
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text("${nurse.title}".tr,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                )),
                          ),
                        )
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
                            ": ${functions().Change_Date_Format(nurse.birthdate!)}",
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
                        const Icon(Icons.email),
                        Text('_Email'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(": ${nurse.email}",
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
                        Text(": ${nurse.phone1}",
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
                        Text(": ${nurse.workplace}",
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
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(": ${nurse.education}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                )),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.medical_services_outlined),
                        Text('_services'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ])),
              Column(
                children: [
                  for (A in nurse.services!)
                    Row(
                      children: [
                        const Icon(Icons.check_circle_outline),
                        Expanded(
                          child: Text(A,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              )),
                        )
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: h * 0.25,
                width: w * 0.9,
                child: Image.network(nurse.licence!),
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
                  : isadmin && !nurse.status!
                      ? Row(
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
                                      FlatButton(
                                        child: Text('_no'.tr),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                      FlatButton(
                                        child: Text('_yes'.tr),
                                        onPressed: () async {
                                          deletenurse(nurse.userid!,
                                              nurse.email!, nurse.password!);
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
                        )
                      : Container(),
            ],
          ),
        ]));
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
