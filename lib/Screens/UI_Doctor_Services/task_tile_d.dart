//import 'package:firebase_storage/firebase_storage.dart';
// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_Appointment/Appointment.dart';
import 'package:intl/intl.dart';

import '../../DB/functions.dart';

class TaskTile_D extends StatelessWidget {
  final appointment task;
  const TaskTile_D(this.task, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        //  width: SizeConfig.screenWidth * 0.78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: task.booked!
              ? Colors.green
              : Colors.grey, // _getBGClr(task?.color ?? 0),
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('_Date'.tr + ' : ',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16)),
                    Text(
                      "${functions().Change_Date_Format(task.date!)}",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     Text('_Day'.tr + ' : ',
                //         style:
                //             const TextStyle(color: Colors.white, fontSize: 16)),
                //     Text(
                //       "${DateFormat('EEEE').format(task.date!.toDate())}",
                //       style: const TextStyle(color: Colors.white, fontSize: 16),
                //     ),
                //   ],
                // ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: Colors.grey[200],
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "${functions().replaceFarsiNumber(task.time!)}  ",
                      style: TextStyle(fontSize: 16, color: Colors.grey[100]),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                /*Text(
                  task?.note ?? "",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 15, color: Colors.grey[100]),
                  ),
                ),*/
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 0.5,
            color: Colors.grey[200]!.withOpacity(0.7),
          ),
          /*  RotatedBox(
            quarterTurns: 3,
            child: Text(
              task.isCompleted == 1 ? "COMPLETED" : "TODO",
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),*/
        ]),
      ),
    );
  }

  _getBGClr(int no) {
    switch (no) {
      case 0:
        return Colors.blue;
      case 1:
        return const Color.fromARGB(255, 228, 50, 109);
      case 2:
        return Colors.yellow;
      default:
        return Colors.blue;
    }
  }
}
