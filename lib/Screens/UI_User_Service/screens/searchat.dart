// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Screens/UI_User_Service/components/Doctor_item.dart';
import 'package:graduation_project/Screens/UI_User_Service/components/nurseitem.dart';
import 'package:graduation_project/themes.dart';
import '../../../DB/Models/M_doctor/doctormodel.dart';
import '../../../DB/Models/M_nurse/nurse_model.dart';
import '../../../Model/Home/Address/addresscontroller.dart';

class SearchAt extends StatefulWidget {
  bool? type;
  String? category;
  String? city;
  int? cityid;
  SearchAt({Key? key,required this.type,required this.category, required this.city, required this.cityid})
      : super(key: key);

  @override
  State<SearchAt> createState() => _SearchAtState();
}

addcontroller controller = Get.put(addcontroller());

class _SearchAtState extends State<SearchAt> {
  int? cityid;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(controller.city);
    print(controller.cityid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF002536),
        elevation: 10,
        shadowColor: const Color(0xFF002536),
        title: Text(
          '_searchin'.tr,
          textAlign: TextAlign.center,
        ),
        actions: const <Widget>[],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              '${'_searchin'.tr} ${controller.city}',
              style: TitleStyle,
            ),
            Expanded(
              child:
              widget.type ==true?
               FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('nurse')
                      .where('city', isEqualTo: controller.cityid.value)
                      .get(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, i) {
                            int cityid = snapshot.data.docs[i].data()['city'];
                            int govid =
                                snapshot.data.docs[i].data()['government'];
                            NurseModel nurse = NurseModel.fromJson(
                              snapshot.data.docs[i].data(),
                              controller.getcityname(cityid)!,
                              controller.getgovname(govid)!,
                            );

                            return item(nurse: nurse);
                          });
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }):FutureBuilder(
                future: FirebaseFirestore.instance
                      .collection('doctor').where('category', isEqualTo: widget.category)
                      .where('city', isEqualTo: controller.cityid.value)
                      .get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, i) {
                          int cityid = snapshot.data.docs[i].data()['city'];
                          int govid =
                              snapshot.data.docs[i].data()['government'];

                          /* int category =
                              snapshot.data.docs[i].data()['catname']!;*/
                          DoctorModel doctorModel = DoctorModel.fromJson(
                              snapshot.data.docs[i].data(),
                              controller.getcityname(cityid)!,
                              controller.getgovname(govid)!,
                              '');

                          return doctoritem(doctorModel: doctorModel);
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
            ),
          ],
        ),
      ),
    );
  }
}
