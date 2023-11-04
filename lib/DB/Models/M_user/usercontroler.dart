// ignore_for_file: prefer_typing_uninitialized_variables, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation_project/DB/Models/M_doctor/doctormodel.dart';
import 'package:graduation_project/DB/Models/M_nurse/nurse_model.dart';
import 'package:graduation_project/DB/Models/M_user/user.dart';
import 'package:graduation_project/Model/Home/Address/addresscontroller.dart';
import 'package:graduation_project/main.dart';

class UserControler extends GetxController with StateMixin {
  addcontroller controller = Get.put(addcontroller());
  var data;
  UserModel? user;
  var favnurse = <NurseModel>[].obs;
  var favdoctor = <DoctorModel>[].obs;

  getdata() async {
    change(null, status: RxStatus.loading());

    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot ds) {
      data = ds;

      user = UserModel.fromJson(data.data());
      print(user!.cityname);
      print(user!.governmentname);
    });
    change(null, status: RxStatus.success());
  }

  getfav(String? userid) async {
    try {
      change(null, status: RxStatus.loading());

      final fav = await FirebaseFirestore.instance
          .collection('users')
          .doc(userid)
          .collection('favs')
          .get()
          .then((value) async {
        for (var fav in value.docs) {
          NurseModel? nurseModel;
          if (fav.data()['type'] == 'nurse') {
            await FirebaseFirestore.instance
                .collection('nurse')
                .doc(fav.data()['favid'])
                .get()
                .then((value) {
              favnurse.add(NurseModel.fromJson(value.data()!, '', ''));
            });
          } else {
            await FirebaseFirestore.instance
                .collection('doctor')
                .doc(fav.data()['favid'])
                .get()
                .then((value) {
              favdoctor.add(DoctorModel.fromJson(value.data()!, '', '', ''));
            });
          }
        }
      });

      change(null, status: RxStatus.success());
    } catch (error) {
      return null;
    }
  }

  @override
  void onInit() {
    if (box.read('type') == 'user') {
      getdata();
    }

    super.onInit();
  }


   @override
  void onClose() {
    super.onClose();
    favdoctor.clear();
    favnurse.clear();
  }

}


