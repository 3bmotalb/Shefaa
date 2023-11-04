import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_doctor/doctormodel.dart';
import 'package:graduation_project/Model/Home/Address/addresscontroller.dart';

class DoctorController extends GetxController with StateMixin {
  // ignore: prefer_typing_uninitialized_variables
  DoctorModel? doctor;
  Map<String, dynamic>? doctorstore;
  addcontroller controller = Get.put(addcontroller());

  getdata() async {
    change(null, status: RxStatus.loading());

    await FirebaseFirestore.instance
        .collection('doctor')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot value) async {
      doctorstore = value.data() as Map<String, dynamic>;

      await FirebaseFirestore.instance
          .collection('category')
          .doc(doctorstore!['category'])
          .get()
          .then((value) async {
        var cat = value.data() as Map<String, dynamic>;
        String? city =  controller.getcityname(doctorstore!['city']);
        String? gov =  controller.getgovname(doctorstore!['government']);
        doctor =
            DoctorModel.fromJson(doctorstore!, cat['namecat'.tr], city, gov);
      });
    });
    if (doctor!.status!) {
      change(null, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.empty());
    }
  }

  // getdatatouser(String userid) async {
  //   change(null, status: RxStatus.loading());
  //   print("/////////////////////");
  //   print(FirebaseAuth.instance.currentUser!.uid);
  //   await FirebaseFirestore.instance
  //       .collection('doctor')
  //       .doc(userid)
  //       .get()
  //       .then((DocumentSnapshot) {
  //     data = DocumentSnapshot;
  //     doctorstore = DoctorModel.fromJson(data.data());
  //
  //   });

  //   change(null, status: RxStatus.success());
  // }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
