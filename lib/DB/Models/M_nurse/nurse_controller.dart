// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_nurse/nurse_model.dart';
import 'package:graduation_project/Model/Home/Address/addresscontroller.dart';
import 'package:graduation_project/main.dart';

class NurseController extends GetxController with StateMixin {
  Map<String,dynamic>? data;
  NurseModel? nurse;
  NurseModel? nursestore;
    addcontroller controller = Get.put(addcontroller());


  getdata() async {
    change(null, status: RxStatus.loading());
    
    await FirebaseFirestore.instance
        .collection('nurse')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot value) async{
      data = value.data() as Map<String,dynamic>;
      String? city =controller.getcityname(data!['city']);
      String? gov= controller.getgovname(data!['government']);
      nurse = NurseModel.fromJson(data!,city,gov);
      
    });

    if (nurse!.status!) {
      change(null, status: RxStatus.success());
    }
    else {
      change(null, status: RxStatus.empty());
    }
  }

  getdatatouser(String userid) async {
    change(null, status: RxStatus.loading());
    
    await FirebaseFirestore.instance
        .collection('nurse')
        .doc(userid)
        .get()
        .then((DocumentSnapshot value) async{
      data = value.data() as Map<String,dynamic>;
      String? city =controller.getcityname(data!['city']);
       String? gov= controller.getgovname(data!['government']);
      nursestore = NurseModel.fromJson(data!,city,gov);
      
    });

    change(null, status: RxStatus.success());
  }

  @override
  void onInit() {
   
    if (box.read('type') == 'nurse') {
      getdata();
    }
    super.onInit();
  }
}
