// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, unused_import, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../DB/functions.dart';
import '../../themes.dart';
import 'medicine.dart';

class MedicineTile extends StatelessWidget {
  final Medicine? medicine;
  const MedicineTile(this.medicine);

  @override
  Widget build(BuildContext context) {
    DateTime starttime = DateFormat.jm().parse(medicine!.starttime.toString());
    DateTime secondtime;
    DateTime thirdtime;
    var _2ndtime;
    var _3rdtime;
    var Firsttime = DateFormat('HH:mm').format(starttime);
    if (medicine!.interval == 2) {
      secondtime = starttime.add(const Duration(hours: 12));
      _2ndtime = DateFormat('HH:mm').format(secondtime);
    }
    if (medicine!.interval == 3) {
      secondtime = starttime.add(const Duration(hours: 8));
      thirdtime = secondtime.add(const Duration(hours: 8));
      _2ndtime = DateFormat('HH:mm').format(secondtime);
      _3rdtime = DateFormat('HH:mm').format(thirdtime);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        //  width: SizeConfig.screenWidth * 0.78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: _getBGClr(medicine?.image ?? 0),
        ),
        child: Row(children: [
          Container(
              margin: const EdgeInsets.only(right: 5),
              height: 40,
              width: 40,
              child: _getImg(medicine?.image ?? 0)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medicine?.name ?? "",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: Colors.grey[200],
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    medicine!.interval == 1
                        ? Text(
                            functions().time_to_ar(Firsttime),
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[100]),
                          )
                        : medicine!.interval == 2
                            ? Column(
                                children: [
                                  Text(
                                    "${functions().time_to_ar(Firsttime)}",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey[100]),
                                  ),
                                  Text(
                                    "${functions().time_to_ar(_2ndtime)}",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey[100]),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  Text(
                                    "${functions().time_to_ar(Firsttime)} ",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey[100]),
                                  ),
                                  Text(
                                    "${functions().time_to_ar(_2ndtime)} ",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey[100]),
                                  ),
                                  Text(
                                    "${functions().time_to_ar(_3rdtime)} ",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey[100]),
                                  )
                                ],
                              ),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 10),
          //   height: 60,
          //   width: 0.5,
          //   color: Colors.grey[200]!.withOpacity(0.7),
          // ),
          // RotatedBox(
          //   quarterTurns: 3,
          //   child: Text(
          //     medicine!.iscompleted == 1 ? "COMPLETED" : "Take",
          //     style: GoogleFonts.lato(
          //       textStyle: TextStyle(
          //           fontSize: 10,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.white),
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }

  _getBGClr(int no) {
    switch (no) {
      case 0:
        return capsule;
      case 1:
        return cream;
      case 2:
        return drops;
      case 4:
        return syringe;
      case 5:
        return syrup;

      default:
        return pills;
    }
  }

  _getImg(int no) {
    switch (no) {
      case 0:
        return Image.asset(
          'assets/images/capsule.png',
          fit: BoxFit.cover,
        );
      case 1:
        return Image.asset(
          'assets/images/cream.png',
          fit: BoxFit.cover,
        );
      case 2:
        return Image.asset(
          'assets/images/drops.png',
          fit: BoxFit.cover,
        );
      case 4:
        return Image.asset(
          'assets/images/syringe.png',
          fit: BoxFit.cover,
        );
      case 5:
        return Image.asset(
          'assets/images/syrup.png',
          fit: BoxFit.cover,
        );

      default:
        return Image.asset(
          'assets/images/pills.png',
          fit: BoxFit.cover,
        );
    }
  }
}
