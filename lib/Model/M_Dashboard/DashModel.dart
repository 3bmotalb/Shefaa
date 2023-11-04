import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:graduation_project/Screens/UI_Dashboard/advices.dart';
import 'package:graduation_project/Screens/UI_Dashboard/alltown.dart';
import 'package:graduation_project/Screens/UI_Dashboard/AllMedicalTeamUI/AllDoctorsUI.dart';
import 'package:graduation_project/Screens/UI_Dashboard/AllMedicalTeamUI/AllNursesUI.dart';
import 'package:graduation_project/Screens/UI_Dashboard/Requests/Doc_request.dart';
import 'package:graduation_project/Screens/UI_Dashboard/Requests/Nur_Request.dart';

import '../../themes.dart';

// ignore: must_be_immutable
class DashItemModel extends StatelessWidget {
  DashConModel dashConM;
  DashItemModel({Key? key, required this.dashConM}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      height: h * .2,
      width: w * .15,
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? DarkGrey.withOpacity(.9)
            : const Color(0xFFF2F2F2).withOpacity(.97),

        // color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(w * .04),
      ),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: dashConM.fun,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: w * .25,
              height: h * .17,
              margin: EdgeInsets.only(top: h * .005, left: w * .001),
              child: Image.asset(
                "${dashConM.image}",

                // alignment: Alignment.center,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              dashConM.name!.tr,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                // fontFamily: "Lobster",
                fontSize: 15,

                color: Get.isDarkMode ? Colors.white : DarkBlue,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DashConModel {
  String? name, image;
  int? id;
  Callback? fun;

  DashConModel({
    this.id,
    this.name,
    this.image,
    this.fun,
  });
}

List<DashConModel> dashConModel = [
  DashConModel(
      id: 0,
      name: "_doctorRequests".tr,
      image: "assets/images/aracterdoctor.png",
      fun: () {
        Get.to(const DoctorRequests());
      }),
  DashConModel(
      id: 1,
      name: "_showAllDoctors".tr,
      image: "assets/images/Medical_team.png",
      fun: () {
        Get.to(const AllDoctors());
      }),
  DashConModel(
      id: 2,
      name: "_nurseRequests".tr,
      image: "assets/doctor.jpg",
      fun: () {
        Get.to(const NurseRequests());
      }),
  DashConModel(
      id: 3,
      name: "_showAllNurses".tr,
      image:
          "assets/images/Clipart, Nurse, Doctor Illustration PNG Transparent Clipart Image and PSD File for Free Download_prev_ui.png",
      fun: () {
        Get.to(const AllNurses());
      }),
  DashConModel(
      id: 4,
      name: "_addTown".tr,
      image: "assets/images/Boston City Scape_prev_ui.png",
      fun: () {
        Get.to(const Alltown());
      }),
  DashConModel(
      id: 5,
      name: "_dayTip".tr,
      image: "assets/images/imagens para capa de fichario_prev_ui.png",
      fun: () {
        Get.to(const Advises());
      }),
];
