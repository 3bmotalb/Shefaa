import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_Appointment/appointment_controller.dart';
import '../../themes.dart';
import 'AppList.dart';

class apptab extends StatefulWidget {
  const apptab({Key? key}) : super(key: key);

  @override
  State<apptab> createState() => _apptabState();
}

class _apptabState extends State<apptab> {
  final Appcontroller _Appcontroller = Get.put(Appcontroller());
  void initState() {
    super.initState();
    _Appcontroller.getappointmet(FirebaseAuth.instance.currentUser!.uid);
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
                    '_MangeAppointments'.tr,
                    style: const TextStyle(color: Colors.white),
                  ),
                  bottom: TabBar(
                    tabs: <Widget>[
                      Tab(
                          icon: const Icon(Icons.timer_off_outlined),
                          text: ('_unbooked'.tr)),
                      Tab(icon: const Icon(Icons.timer), text: ('_booked'.tr)),
                    ],
                  )),
              body: TabBarView(
                children: [
                  Page7(applist: _Appcontroller.applist),
                  bookedApp(applist: _Appcontroller.applist),
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
