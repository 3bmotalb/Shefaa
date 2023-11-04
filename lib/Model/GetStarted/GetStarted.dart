// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class GetStartedModel {
//   int? id;
//   String? image, tittle, subTittle;
//
//   GetStartedModel({this.id, this.image, this.tittle, this.subTittle});
// }

List<Widget> startModel = [
  GetSModel(
      image: "assets/images/A 24_7 personal doctor_prev_ui.png",
      tittle: "_controlDrugs".tr,
      subTittle: "_controlDrugsSub".tr),
  GetSModel(
      image: "assets/images/medicalCare.png",
      tittle: "5".tr,
      subTittle: "_medicalTeamBoard".tr),
  // GetSModel(
  //     image: "assets/images/blood-test.png", tittle: "6".tr, subTittle: "7".tr),
];

//...................... Model ............................//
class GetSModel extends StatelessWidget {
  final String tittle;
  final String? subTittle;
  final String? image;

   const GetSModel({Key? key, required this.tittle, this.subTittle, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return  ListView(

        padding: EdgeInsets.symmetric(horizontal: w * .03, vertical: h * .07),
        children: [
          Image.asset(
            image!,
            width: w * .4,
            height: h * .3,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: h*.03,horizontal: w*.03),
alignment: Alignment.center,
            width: w * .3,
            height: h * .15,
            child: Text(tittle, style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: EdgeInsets.only(bottom: h*.06),

            width: w*.4,
            height: h*.4,
            child: Text(subTittle!,maxLines: 3,),
          ),
        ],

    );
  }
}
