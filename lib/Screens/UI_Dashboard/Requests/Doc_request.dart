import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_doctor/doctormodel.dart';
import 'package:graduation_project/Model/M_Dashboard/Requests/DoctorRequests.dart';
import 'package:graduation_project/themes.dart';

import '../../../Model/Home/Address/addresscontroller.dart';

class DoctorRequests extends StatelessWidget {
  const DoctorRequests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    addcontroller controller = Get.put(addcontroller());

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text("_doctorRequests".tr),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: w * .02,
        ),
        height: h,
        width: w,
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('doctor')
                .where('status', isEqualTo: false)
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    int cityid = snapshot.data.docs[index].data()['city'];
                    int govid = snapshot.data.docs[index].data()['government'];
                    DoctorModel doctor = DoctorModel.fromJson(
                      snapshot.data.docs[index].data(),
                      '',
                      controller.getcityname(cityid)!,
                      controller.getgovname(govid)!,
                    );
                    return DocRequestsModel(
                      doctor: doctor,
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
