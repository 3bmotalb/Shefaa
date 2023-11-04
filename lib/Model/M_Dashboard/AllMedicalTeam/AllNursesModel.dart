// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_nurse/nurse_model.dart';
import 'package:graduation_project/Screens/UI_Nurse_Service/Profile.dart';

import '../../../themes.dart';

class AllNursesModel extends StatelessWidget {
  NurseModel nurse;
  AllNursesModel({Key? key, required this.nurse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(w * .01),
      padding: EdgeInsets.only(top: h * .02),
      height: h * .15,
      width: w * .9,
      decoration: BoxDecoration(
          color: Get.isDarkMode
              ? DarkGrey.withOpacity(.5)
              : LightGrey0.withOpacity(.7),
          borderRadius: BorderRadius.circular(w * .02)),

      child: Column(
        children: [
          ListTile(
            onTap: () {
              Get.to(Profile(
                nurse: nurse,
                isadmin: true,
              ));
            },
            leading: CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.transparent,
                child: Image.network(
                  nurse.image!,
                  fit: BoxFit.cover,
                )),
            title: Text(nurse.full_name!),
            // subtitle: Text("Doctors's Specialise"),
          ),
          const Divider(
            thickness: 3,
          ),
        ],
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
