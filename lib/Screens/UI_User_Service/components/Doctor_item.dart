// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_doctor/doctormodel.dart';
import 'package:graduation_project/DB/Models/M_nurse/nurse_model.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/nurse_details.dart';
import 'package:graduation_project/themes.dart';

import '../screens/doctordetails.dart';
import 'Doctor_detailsitem.dart';

class doctoritem extends StatefulWidget {
  doctoritem({Key? key, required this.doctorModel}) : super(key: key);
  DoctorModel doctorModel;
  @override
  State<doctoritem> createState() => _itemState();
}

class _itemState extends State<doctoritem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      alignment: Alignment.center,
      color: Colors.white,
      child: Card(
        color: Color.fromARGB(255, 249, 247, 247),
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(widget.doctorModel.image!),
                ),
                //network(widget.doctorModel.image!),
                title: Text(
                  'Dr'.tr + widget.doctorModel.full_name!,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                //subtitle:
                //isThreeLine: true,
                trailing: IconButton(
                  onPressed: () {
                    Get.to(doctordata(
                      doctor: widget.doctorModel,
                    ));
                  },
                  icon: const Icon(
                    Icons.calendar_today,
                    color: Color(0xff6AD768),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        // margin: EdgeInsets.only(bottom: 15),
                        // alignment: Alignment.topCenter,
                        child: Icon(
                          Icons.medical_services,
                          color: Colors.blue[400],
                          size: 20,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          (widget.doctorModel.bio!),
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 20,
                      ),
                      Expanded(
                        child: Text(
                          (widget.doctorModel.clinic_address!),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Colors.green,
                        size: 20,
                      ),
                      Text(
                        (widget.doctorModel.vezeta.toString()),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      Text(
                        // commentcontroller.avg.toString(),
                        (widget.doctorModel.rate!).toStringAsFixed(1),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
