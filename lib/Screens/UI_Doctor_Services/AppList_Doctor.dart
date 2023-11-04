// ignore: file_names
// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_Appointment/Appointment.dart';
import 'package:graduation_project/DB/Models/M_Appointment/appointment_controller.dart';
import 'package:graduation_project/Screens/UI_Doctor_Services/task_tile_d.dart';
import 'package:intl/intl.dart';
import 'package:graduation_project/themes.dart';

import '';

// ignore: must_be_immutable
class Page7_D extends StatefulWidget {
  RxList<appointment> applist;
  Page7_D({Key? key, required this.applist}) : super(key: key);

  @override
  State<Page7_D> createState() => _Page7_DState();
}

class _Page7_DState extends State<Page7_D> {
  // ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: widget.applist.isNotEmpty
            ? ListView.builder(
                itemCount: widget.applist.length,
                itemBuilder: (context, index) {
                  appointment app = widget.applist[index];
                  if (app.date!.toDate().isAfter(DateTime.now()) ||
                      DateFormat('dd-MM-yyyy').format(app.date!.toDate()) ==
                              DateFormat('dd-MM-yyyy').format(DateTime.now()) &&
                          app.booked == false) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                        child: FadeInAnimation(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),

                            child: TaskTile_D(widget.applist[index]),
                            // child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //     children: [
                            //       Column(
                            //         children: const [Icon(Icons.access_time)],
                            //       ),
                            //       Column(
                            //         crossAxisAlignment: CrossAxisAlignment.center,
                            //         children: [
                            // Text('_Date'.tr),
                            // Text(
                            //   ":${DateFormat('dd-MM-yyyy').format(app.date!.toDate())}",
                            //   style: const TextStyle(
                            //       color: Colors.black, fontSize: 25),
                            // ),
                            // Text('_Day'.tr),
                            // Text(
                            //   ":${DateFormat('EEEE').format(app.date!.toDate())}",
                            //   style: const TextStyle(
                            //       color: Colors.black, fontSize: 25),
                            // ),
                            //           Text('_Time'.tr),
                            //           Text(
                            //             ":${app.time}",
                            //             style: const TextStyle(
                            //                 color: Colors.black, fontSize: 25),
                            //           ),
                            //           Text('_Price'.tr),
                            //           Text(
                            //             ":${app.price}",
                            //             style: const TextStyle(
                            //                 color: Colors.black, fontSize: 25),
                            //           ),
                            //           Text('_Booked'.tr),
                            //           Text(
                            //             ":${app.booked}",
                            //             style: const TextStyle(
                            //                 color: Colors.black, fontSize: 25),
                            //           )
                            //         ],
                            //       ),
                            //       Column(
                            //         children: const [
                            //           Icon(Icons.arrow_forward_ios_rounded),
                            //         ],
                            //       ),
                            //     ]),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            : Center(child: Text('_NoAppointment'.tr)));
  }
}

class bookedApp_D extends StatefulWidget {
  RxList<appointment> applist;

  bookedApp_D({Key? key, required this.applist}) : super(key: key);

  @override
  State<bookedApp_D> createState() => _bookedAppState();
}

class _bookedAppState extends State<bookedApp_D> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: widget.applist.isNotEmpty
            ? ListView.builder(
                itemCount: widget.applist.length,
                itemBuilder: (context, index) {
                  appointment app = widget.applist[index];
                  if (app.booked == true) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                        child: FadeInAnimation(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),

                            child: TaskTile_D(widget.applist[index]),
                            // child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //     children: [
                            //       Column(
                            //         children: const [Icon(Icons.access_time)],
                            //       ),
                            //       Column(
                            //         crossAxisAlignment: CrossAxisAlignment.center,
                            //         children: [
                            //           Text('_Date'.tr),
                            //           Text(
                            //             ":${DateFormat('dd-MM-yyyy').format(app.date!.toDate())}",
                            //             style: const TextStyle(
                            //                 color: Colors.black, fontSize: 25),
                            //           ),
                            //           Text('_Day'.tr),
                            //           Text(
                            //             ":${DateFormat('EEEE').format(app.date!.toDate())}",
                            //             style: const TextStyle(
                            //                 color: Colors.black, fontSize: 25),
                            //           ),
                            //           Text('_Time'.tr),
                            //           Text(
                            //             ":${app.time}",
                            //             style: const TextStyle(
                            //                 color: Colors.black, fontSize: 25),
                            //           ),
                            //           Text('_Price'.tr),
                            //           Text(
                            //             ":${app.price}",
                            //             style: const TextStyle(
                            //                 color: Colors.black, fontSize: 25),
                            //           ),
                            //           Text('_Booked'.tr),
                            //           Text(
                            //             ":${app.booked}",
                            //             style: const TextStyle(
                            //                 color: Colors.black, fontSize: 25),
                            //           )
                            //         ],
                            //       ),
                            //       Column(
                            //         children: const [
                            //           Icon(Icons.arrow_forward_ios_rounded),
                            //         ],
                            //       ),
                            //     ]),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            : Center(child: Text('_NoAppointment'.tr)));
  }
}
