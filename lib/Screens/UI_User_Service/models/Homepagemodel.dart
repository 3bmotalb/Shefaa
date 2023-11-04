import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import '../../../themes.dart';
import '../../UI_Medicine/home_page.dart';
import '../screens/allcategory.dart';
import '../screens/nursepage.dart';

// ignore: must_be_immutable
class homepagemodel extends StatelessWidget {
  homeconmodel homconm;
  homepagemodel({Key? key, required this.homconm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: h * .5,
      //h * .014
      width: w * .4,
      //w * .010,
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? DarkGrey.withOpacity(.9)
            : const Color(0xFFF2F2F2).withOpacity(.97),

        // color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(w * .04),
      ),
      child: GestureDetector(
        onTap: homconm.fun,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: w * .2,
              height: h * .1,
              margin: EdgeInsets.only(top: h * .005, left: w * .001),
              child: Image.asset(
                "${homconm.image}",

                // alignment: Alignment.center,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              homconm.name!.tr,
              maxLines: 2,
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

class homeconmodel {
  String? name, image;
  int? id;
  Callback? fun;

  homeconmodel({
    this.id,
    this.name,
    this.image,
    this.fun,
  });
}

List<homeconmodel> Homeconmodel = [
  homeconmodel(
      id: 0,
      name: '_doctoring'.tr,
      image: "assets/images/aracterdoctor.png",
      fun: () {
        Get.to(const AllCategory());
      }),
  homeconmodel(
      id: 1,
      name: "2".tr,
      image: "assets/images/Medicine (2).png",
      fun: () {
        Get.to(const HomePage());
      }),
  homeconmodel(
      id: 2,
      name: '_Nursing'.tr,
      image: "assets/doctor.jpg",
      fun: () {
        Get.to(homebage());
      }),
  /* homeconmodel(
      id: 3,
      name: '6'.tr,
      image:
          "assets/images/Clipart, Nurse, Doctor Illustration PNG Transparent Clipart Image and PSD File for Free Download_prev_ui.png",
      fun: () {
        // Get.to(const AllNurses());
      }),*/
  /* homeconmodel(
      id: 4,
      name: "_addTown".tr,
      image: "assets/images/Boston City Scape_prev_ui.png",
      fun: () {
        Get.to(const Alltown());
      }),
  homeconmodel(
      id: 5,
      name: "_dayTip".tr,
      image: "assets/images/imagens para capa de fichario_prev_ui.png",
      fun: () {
        Get.to(const Advises());
      }),*/
];
