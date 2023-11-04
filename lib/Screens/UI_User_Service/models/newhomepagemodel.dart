import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/doctor_list.dart';
import '../../../themes.dart';
import '../../UI_Medicine/home_page.dart';
import '../screens/allcategory.dart';
import '../screens/nursepage.dart';

// ignore: must_be_immutable
class newhomepagemodel extends StatelessWidget {
  Data homconm;
  newhomepagemodel({Key? key, required this.homconm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: 5,
      //,
      width: 5,
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
                "${homconm.imageurl}",

                // alignment: Alignment.center,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              homconm.text,
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

class Data {
  final String imageurl, text;
  Callback? fun;
  String? id;
  Data({required this.imageurl, required this.text, this.fun, this.id});
}

List<Data> itemdata = [
  Data(
      id: 'iHH7e2CRyRp5xRJfo43a',
      text: '_Heart'.tr,
      imageurl: "assets/category_images/cardiologist.png",
      fun: () {
        Get.to(doctorlist(
          category: 'iHH7e2CRyRp5xRJfo43a',
        ));
      }),
  Data(
      id: 'wLVjo5QlPV5YMNx3zp2V',
      text: "Dentist".tr,
      imageurl: "assets/dentist.png",
      fun: () {
        Get.to(doctorlist(
          category: 'wLVjo5QlPV5YMNx3zp2V',
        ));
      }),
  Data(
      id: 'HwZVMPluLMcV59OYHBez',
      text: "Neurologist".tr,
      imageurl: "assets/category_images/Neurologist.png",
      fun: () {
        Get.to(doctorlist(
          category: 'HwZVMPluLMcV59OYHBez',
        ));
      }),
  Data(
      id: 'sHfvaHGWcwOaAHePBCgc',
      text: "Bones".tr,
      imageurl: "assets/category_images/bones.png",
      fun: () {
        Get.to(doctorlist(
          category: 'sHfvaHGWcwOaAHePBCgc',
        ));
      }),
  Data(
      id: 'cd0EsBh9LRmtXCEMe6DD',
      text: "Eyes".tr,
      imageurl: "assets/category_images/eye.png",
      fun: () {
        Get.to(doctorlist(
          category: 'cd0EsBh9LRmtXCEMe6DD',
        ));
      }),
  Data(
      id: '',
      text: "All Categories".tr,
      imageurl: "assets/Team.jpg",
      fun: () {
        Get.to(AllCategory());
      }),
];
