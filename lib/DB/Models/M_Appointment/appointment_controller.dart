import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_Appointment/Appointment.dart';
import 'package:graduation_project/DB/Models/M_nurse/nurse_model.dart';


class Appcontroller extends GetxController with StateMixin {
  NurseModel? nurseModel;

  var applist = <appointment>[].obs;

  getappointmet(String? userid) async {
    List<Map<String, dynamic>> list;
    try {
      change(null, status: RxStatus.loading());

      final appoint = await FirebaseFirestore.instance
          .collection('nurse')
          .doc(userid)
          .collection('appointment')
          .orderBy('createdAt', descending: true)
          .get();
      list = appoint.docs.map((doc) => doc.data()).toList();
      

      applist
          .assignAll(list.map((data) => appointment.fromJson(data)).toList());

      change(null, status: RxStatus.success());
    } catch (error) {
      return null;
    }
  }
  getdocappointmet(String? userid) async {
    List<Map<String, dynamic>> list;
    try {
      change(null, status: RxStatus.loading());

      final appoint = await FirebaseFirestore.instance
          .collection('doctor')
          .doc(userid)
          .collection('appointment')
          .orderBy('createdAt', descending: true)
          .get();
      list = appoint.docs.map((doc) => doc.data()).toList();
      

      applist
          .assignAll(list.map((data) => appointment.fromJson(data)).toList());

      change(null, status: RxStatus.success());
    } catch (error) {
      return null;
    }
  }

  addappoitment(String userid, DateTime date, String time, int price) async {
    var rand = Random().nextInt(100000);
    String id = userid + rand.toString();
    try {
      await FirebaseFirestore.instance
          .collection('nurse')
          .doc(userid)
          .collection('appointment')
          .doc(id)
          .set({
        'date': date,
        'time': time,
        'price': price,
        'booked': false,
        'id': id,
        'createdAt': DateTime.now(),
      });
      Get.defaultDialog(
          title: 'alart',
          middleText: 'success',
          onConfirm: () {
            Get.back();
          });
    } catch (e) {
      Get.defaultDialog(title: 'alart', middleText: 'false' + e.toString());
    }
  }
  // ignore: non_constant_identifier_names
  addappoitment_Doctor(String userid, DateTime date, String time) async {
    var rand = Random().nextInt(100000);
    String id = userid + rand.toString();
    try {
      await FirebaseFirestore.instance
          .collection('doctor')
          .doc(userid)
          .collection('appointment')
          .doc(id)
          .set({
        'date': date,
        'time': time,
        'booked': false,
        'id': id,
        'createdAt': DateTime.now(),
      });
      Get.defaultDialog(
          title: 'alart',
          middleText: 'success',
          onConfirm: () {
            Get.back();
          });
    } catch (e) {
      Get.defaultDialog(title: 'alart', middleText: 'false' + e.toString());
    }
  }

// ignore: non_constant_identifier_names
getappointmet_Doctor(String? userid) async {
    List<Map<String, dynamic>> list;
    try {
      change(null, status: RxStatus.loading());

      final appoint = await FirebaseFirestore.instance
          .collection('doctor')
          .doc(userid)
          .collection('appointment')
          .orderBy('createdAt', descending: true)
          .get();
      list = appoint.docs.map((doc) => doc.data()).toList();

      applist
          .assignAll(list.map((data) => appointment.fromJson(data)).toList());

      change(null, status: RxStatus.success());
    } catch (error) {
      
      return null;
    }
  }

}
