// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_nurse/nurse_model.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/nurse_details.dart';

class item extends StatefulWidget {
  NurseModel nurse;
  item({Key? key, required this.nurse}) : super(key: key);

  @override
  State<item> createState() => _itemState();
}

class _itemState extends State<item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      alignment: Alignment.center,
      color: Colors.white,
      child: ListTile(
        leading: Image.network(widget.nurse.image!),
        title: Text(widget.nurse.full_name!),
        subtitle: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (widget.nurse.cityname!),
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  // commentcontroller.avg.toString(),
                  (widget.nurse.rate!).toStringAsFixed(1),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                )
              ],
            ),
          ],
        ),
        isThreeLine: true,
        trailing: IconButton(
          onPressed: () {
            Get.to(nursedata(
              nurse: widget.nurse,
            ));
          },
          icon: const Icon(
            Icons.calendar_today,
            color: Color(0xff6AD768),
          ),
        ),
      ),
    );
  }
}
