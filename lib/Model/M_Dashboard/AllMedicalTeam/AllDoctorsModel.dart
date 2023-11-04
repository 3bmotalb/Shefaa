// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_doctor/doctormodel.dart';

import '../../../themes.dart';

// ignore: must_be_immutable
class AllDoctorsModel extends StatelessWidget {
  DoctorModel doctor;
  AllDoctorsModel({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(w * .01),
      padding: EdgeInsets.only(top: h * .02),

      width: w * .9,
      decoration: BoxDecoration(
          color: Get.isDarkMode
              ? DarkGrey.withOpacity(.5)
              : LightGrey0.withOpacity(.7),
          borderRadius: BorderRadius.circular(w * .02)),

      child: ListTile(
        onTap: () {
          // Get.to(Profile_D());
        },
        leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 50.0,
            // backgroundColor: Colors.white70,
            child: Image.network(
              doctor.image!,
              fit: BoxFit.contain,
            )),
        title: Text(doctor.full_name!),
        subtitle: Text(doctor.title!),
      ),

      // Row(
      //   children: [
      //
      //     const CircleAvatar(
      //         radius: 40.0,
      //         backgroundColor: Colors.white70,
      //         backgroundImage:  AssetImage("assets/images/person.jpg")),
      //     Container(
      //         margin: EdgeInsets.all(w*.02),
      //         alignment: Alignment.topCenter,
      //         child: const Text("Nurse's Name")),
      //     IconButton(onPressed: (){}, icon: const Icon(Icons.check_circle),color: Colors.green,iconSize: w*.12),
      //     IconButton(onPressed: (){}, icon: const Icon(Icons.cancel_rounded),color: Colors.red,iconSize: w*.12)
      //
      //   ],
      // ),
    );
  }
}
