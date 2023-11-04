// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_Appointment/Appointment.dart';
import 'package:graduation_project/DB/Models/M_nurse/nurse_model.dart';
import 'package:graduation_project/DB/Models/M_request/requesttest.dart';
import 'package:graduation_project/DB/Models/M_user/user.dart';

import '../../../Model/Home/Address/addresscontroller.dart';

class RequestController extends GetxController with StateMixin {
  List requests = [];
  List requestsAccepted = [];
      addcontroller controller = Get.put(addcontroller());


  getrquests(String nurseid) async {
    change(null, status: RxStatus.loading());

    await FirebaseFirestore.instance
        .collection('request')
        .where('nurseid', isEqualTo: nurseid)
        .orderBy('createdAt', descending: true)
        .get()
        .then((value) async {
      for (var requestdoc in value.docs) {
        String requestid = requestdoc.id;
        UserModel? Userstore;
        appointment? app;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(requestdoc.data()['userid'])
            .get()
            .then((value) {
          Userstore = UserModel.fromJson(value.data()!);
        });

        await FirebaseFirestore.instance
            .collection('nurse')
            .doc(requestdoc.data()['nurseid'])
            .collection('appointment')
            .doc(requestdoc.data()['appointment_id'])
            .get()
            .then((value) {
          app = appointment.fromJson(value.data()!);
        });
        if (requestdoc.data()['status'] == 'Accepted') {
          requestsAccepted.add(RequestTest.fromJson(
              requestdoc.data(), Userstore!, app!, requestid));
        } else if (requestdoc.data()['status'] == 'Pending') {
          requests.add(RequestTest.fromJson(
              requestdoc.data(), Userstore!, app!, requestid));
        }
      }
    });
    

    change(null, status: RxStatus.success());
  }

  getrqueststouser(String userid) async {
    change(null, status: RxStatus.loading());

    await FirebaseFirestore.instance
        .collection('request')
        .where('userid', isEqualTo: userid)
        .orderBy('createdAt', descending: true)
        .get()
        .then((value) async {
      for (var requestdoc in value.docs) {
        String requestid = requestdoc.id;
        NurseModel? nurseModel;
        appointment? app;
        await FirebaseFirestore.instance
            .collection('nurse')
            .doc(requestdoc.data()['nurseid'])
            .get()
            .then((value) async{
              var data = value.data()!;
              String? city =controller.getcityname(data['city']);
       String? gov= controller.getgovname(data['government']);
          nurseModel = NurseModel.fromJson(data,city,gov);
        });

        await FirebaseFirestore.instance
            .collection('nurse')
            .doc(requestdoc.data()['nurseid'])
            .collection('appointment')
            .doc(requestdoc.data()['appointment_id'])
            .get()
            .then((value) {
          app = appointment.fromJson(value.data()!);
        });
        
          requests.add(RequestTest.fromJsontouser(
              requestdoc.data(), nurseModel!, app!, requestid));
        
      }
    });
    

    change(null, status: RxStatus.success());
  }

  @override
  void onClose() {
    super.onClose();
    requests.clear();
    requestsAccepted.clear();
  }
}
