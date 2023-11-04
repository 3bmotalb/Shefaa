import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_Appointment/appointment_controller.dart';
import 'package:graduation_project/Screens/UI_Doctor_Services/AppList_Doctor.dart';
import '../../themes.dart';
import 'AppList_Doctor.dart';

class apptab_D extends StatefulWidget {
  const apptab_D({Key? key}) : super(key: key);

  @override
  State<apptab_D> createState() => _apptabState();
}

class _apptabState extends State<apptab_D> {
  final Appcontroller _Appcontroller = Get.put(Appcontroller());
  @override
  void initState() {
    super.initState();
    _Appcontroller.getdocappointmet(FirebaseAuth.instance.currentUser!.uid);
  }
    @override
    Widget build(BuildContext context) {
      return _Appcontroller.obx((state) {
        return DefaultTabController(
            length: 2,
            child: Scaffold(
                backgroundColor: context.theme.backgroundColor,
                appBar: AppBar(
                    backgroundColor: PrimaryColor,
                    title: Text(
                      '_AppointmentTabs'.tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                    bottom: TabBar(
                      tabs: <Widget>[
                        Tab(
                            icon: const Icon(Icons.timer_off_outlined),
                            text: ('_unbooked'.tr)),
                        Tab(
                            icon: const Icon(Icons.timer),
                            text: ('_booked'.tr)),
                      ],
                    )),
                body: TabBarView(
                  children: [
                    Page7_D(applist: _Appcontroller.applist),
                    bookedApp_D(applist: _Appcontroller.applist),
                  ],
                )));
      },
          onLoading: const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ));
    }
  }

 

