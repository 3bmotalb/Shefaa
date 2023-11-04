import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/Home/container item.dart';
import '../../themes.dart';
import '../UI_Medicine/home_page.dart';
import '../UI_Sign/SignIn.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ContainerItem(
          img: "assets/images/Medicine (2).png",
          tittle: "2".tr,
          subtittle: '3'.tr,
          function: () {
            Get.to(const HomePage());
          },
          clr: LightGrey,
          darkClr: const Color(0xFF818181),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .03),
        ContainerItem(
            img: "assets/images/Medical_team.png",
            tittle: '4'.tr,
            subtittle: '5'.tr,
            darkClr: const Color(0xFFAAAAAA),
            clr: const Color(0xFFF2F2F2),
            function: () {
                Get.to(const SignIn());
              
            }),
        // ContainerItem(
        //   img: "assets/images/blood-test.png",
        //   tittle: '6'.tr,
        //   subtittle: '7'.tr,
        //   clr: LightGrey,
        //   darkClr: const Color(0xFF818181),
        //   function: () {},
        // ),
      ],
    );
  }
}
