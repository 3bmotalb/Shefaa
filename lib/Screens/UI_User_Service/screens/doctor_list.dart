// ignore_for_file: deprecated_member_use, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/DB/Models/M_doctor/doctormodel.dart';
import 'package:graduation_project/DB/Models/M_nurse/nurse_model.dart';
import 'package:graduation_project/DB/Models/M_user/usercontroler.dart';
import 'package:graduation_project/Model/Home/Address/addresscontroller.dart';
import 'package:graduation_project/Screens/UI_Home/Drawer.dart';
import 'package:graduation_project/Screens/UI_Home/MainScreen.dart';
import 'package:graduation_project/Screens/UI_User_Service/components/Doctor_item.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/filterdoc.dart';

import 'package:graduation_project/Screens/UI_User_Service/screens/searchat.dart';
import 'package:graduation_project/main.dart';
//import 'package:grade1/components/nurseitem.dart';

import '../../../Model/Home/Address/Address.dart';
import '../components/nurseitem.dart';
import 'filter.dart';

class doctorlist extends StatefulWidget {
  String? category;
  doctorlist({Key? key, required this.category}) : super(key: key);

  @override
  State<doctorlist> createState() => _homebageState();
}

List<String> unitlist = [
  'Price Low to High',
  'Price High to Low',
  'Rating Low to High',
  'Rating High to Low',
];
String _unit = "";

int? _unitvalue = 0;

class _homebageState extends State<doctorlist> {
  @override
  void initState() {
    super.initState();
  }

  UserControler userControler = Get.put(UserControler());
  addcontroller controller = Get.put(addcontroller());
  List<DoctorModel> doctorlists = [
    DoctorModel(
        image: " assets/dentist.png",
        full_name: "Abdo ahmed ",
        bio: "aaaaaaaaaaaaaaaa",
        clinic_address: "qqqqqqqqqqqq",
        vezeta: 500,
        rate: 4),
    /* DoctorModel(
        image: " assets/dentist.png",
        full_name: "Abdo ahmed ",
        bio: "aaaaaaaaaaaaaaaa",
        clinic_address: "qqqqqqqqqqqq",
        vezeta: 500,
        rate: 5),
    DoctorModel(
        image: " assets/dentist.png",
        full_name: "Abdo ahmed ",
        bio: "aaaaaaaaaaaaaaaa",
        clinic_address: "qqqqqqqqqqqq",
        vezeta: 500,
        rate: 2)*/
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF002536),
        elevation: 10,
        shadowColor: const Color(0xFF002536),
        title: Text(
          "Doctors".tr,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[],
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            child: Container(
              color: Colors.grey[300],
              margin: const EdgeInsets.only(top: 1.0),
              padding: const EdgeInsets.only(left: 10.0),
              height: 60,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      _showunit();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.sort,
                            color: Colors.grey[600],
                          ),
                          Text('Sort'.tr,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              )),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.off(Filterdoc(
                        category: widget.category,
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.filter_list,
                            color: Colors.grey[600],
                          ),
                          Text('Filter'.tr,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          SizedBox(
                            height: 300,
                            child: Column(
                              children: [
                                const Address(),
                                RaisedButton(
                                  onPressed: () {
                                    Get.off(SearchAt(
                                      type: false,
                                      category: widget.category,
                                      city: controller.city.value,
                                      cityid: controller.cityid.value,
                                    ));
                                  },
                                  child: Text('_Confirm'.tr),
                                )
                              ],
                            ),
                          ),
                          backgroundColor: Colors.white,
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.sort,
                            color: Colors.grey[600],
                          ),
                          Text('Place'.tr,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            // child: ListView.builder(
            //   itemCount: doctorlists.length,
            //   itemBuilder: (context, index) {
            //     return doctoritem(
            //       doctorModel: doctorlists[index],
            //     );
            //   },
            // ),

            child: FutureBuilder(
                future: switch_firebase_query(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, i) {
                          int cityid = snapshot.data.docs[i].data()['city'];
                          int govid =
                              snapshot.data.docs[i].data()['government'];

                          /* int category =
                              snapshot.data.docs[i].data()['catname']!;*/
                          DoctorModel doctorModel = DoctorModel.fromJson(
                              snapshot.data.docs[i].data(),
                              controller.getcityname(cityid)!,
                              controller.getgovname(govid)!,
                              '');

                          return doctoritem(doctorModel: doctorModel);
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ],
      ),

      // body: ListView.builder(
      //   itemCount: _nurses.length,
      //   itemBuilder: (context, index) {
      //     return item(nurse: _nurses[index]);
      //   },
      // ),
    );
  }

  _showunit() async {
    await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, StateSetter setState) {
              return AlertDialog(
                title: Center(child: Text('_medunit'.tr)),
                content: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                            itemCount: unitlist.length,
                            itemBuilder: (context, i) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(unitlist[i]),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Radio(
                                      value: i,
                                      groupValue: _unitvalue,
                                      onChanged: (int? value) {
                                        setState(() {
                                          _unitvalue = value;
                                        });
                                        print(_unitvalue);
                                      }),
                                ],
                              );
                            }),
                      ),
                    ]),
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('_ok'.tr)),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('_medclose'.tr))
                ],
              );
            },
          );
        });
    setState(() {
      _unit = unitlist[_unitvalue!];
    });
  }

  switch_firebase_query() async {
    if (_unitvalue == 0) {
      return FirebaseFirestore.instance
          .collection('doctor')
          .where('status', isEqualTo: true)
          .where('category', isEqualTo: widget.category)
          .orderBy('vezeta', descending: false)
          .get();
    } else if (_unitvalue == 1) {
      return FirebaseFirestore.instance
          .collection('doctor')
          .where('status', isEqualTo: true)
          .where('category', isEqualTo: widget.category)
          .orderBy('vezeta', descending: true)
          .get();
    } else if (_unitvalue == 2) {
      return FirebaseFirestore.instance
          .collection('doctor')
          .where('status', isEqualTo: true)
          .where('category', isEqualTo: widget.category)
          .orderBy('rate', descending: false)
          .get();
    } else if (_unitvalue == 3) {
      return FirebaseFirestore.instance
          .collection('doctor')
          .where('status', isEqualTo: true)
          .where('category', isEqualTo: widget.category)
          .orderBy('rate', descending: true)
          .get();
    }
  }
}
