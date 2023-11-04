// ignore_for_file: must_be_immutable

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/DB/Models/M_Appointment/Appointment.dart';
import 'package:graduation_project/DB/Models/M_Appointment/appointment_controller.dart';
import 'package:graduation_project/DB/Models/M_doctor/doctormodel.dart';
import 'package:graduation_project/DB/Models/M_nurse/nurse_model.dart';
import 'package:graduation_project/Screens/UI_User_Service/components/task_tile.dart';
import 'package:graduation_project/themes.dart';
import 'package:time/time.dart';

import '../../UI_Doctor_Services/task_tile_d.dart';
import '../../UI_Medicine/home_page.dart';
import 'nurse_booking.dart';

class doctorschedule extends StatefulWidget {
  //NurseModel nurse;
  DoctorModel doctor;
  doctorschedule({Key? key, required this.doctor}) : super(key: key);

  @override
  State<doctorschedule> createState() => _nursscheduleState();
}

var appcontroller = Get.put(Appcontroller());

class _nursscheduleState extends State<doctorschedule> {
  @override
  void initState() {
    super.initState();
    appcontroller.getdocappointmet(widget.doctor.userid);
  }

  DateTime _SelectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return appcontroller.obx(
      (state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('_Appointments'.tr),
            backgroundColor: PrimaryColor,
            centerTitle: true,
            elevation: 0,
          ),
          body: Column(
            children: [
              const SizedBox(height: 20),
              _adddatebar(),
              Expanded(
                  child: ListView.builder(
                      itemCount: appcontroller.applist.length,
                      itemBuilder: (_, i) {
                        appointment app = appcontroller.applist[i];

                        if (app.date!.toDate().date == _SelectedDate) {
                          return AnimationConfiguration.staggeredList(
                            position: i,
                            child: SlideAnimation(
                              child: FadeInAnimation(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          /* Get.to(nursebook(
                                            app: app,
                                          ));*/
                                        },
                                        child:
                                            TaskTile_D(appcontroller.applist[i])
                                        /* child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin:
                                              const EdgeInsets.only(bottom: 12),
                                          child: Container(
                                            padding: const EdgeInsets.all(16),
                                            //  width: SizeConfig.screenWidth * 0.78,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              color: Colors.orange,
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.to(nursebook(
                                                  app: app,
                                                ));
                                              },
                                              child: Text(
                                                  "Appointment at ${DateFormat.jm().format(app.date!.toDate())}"),
                                            ),
                                          )),*/
                                        )
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      })),
            ],
          ),
        );
      },
      onLoading: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  _adddatebar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        locale: locale.initiallocale.languageCode,
        selectionColor: PrimaryColor,
        selectedTextColor: Colors.white,
        onDateChange: (date) {
          setState(() {
            _SelectedDate = date;
          });
        },
        dateTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
        )),
        dayTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
        )),
        monthTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
        )),
      ),
    );
  }
}
