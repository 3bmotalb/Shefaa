import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../Controlers/C_Medicine/medicine_contoller.dart';
import '../../Model/M_Medicine/medicine.dart';
import '../../themes.dart';

class MedicineInfo extends StatefulWidget {
  final int id;
  const MedicineInfo(this.id, {Key? key}) : super(key: key);
  @override
  _MedicineInfoState createState() => _MedicineInfoState();
}

final _medicineContoller = Get.put(MedicineContoller());

class _MedicineInfoState extends State<MedicineInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Medicine medicine = _medicineContoller.onemedicinelist[0];
    _medicineContoller.getMedicinedata(widget.id);
    DateTime starttime = DateFormat.jm().parse(medicine.starttime.toString());
    DateTime secondtime;
    DateTime thirdtime;
    String _2ndtime;
    String _3rdtime;
    var Firsttime = DateFormat('HH:mm a').format(starttime);
    if (medicine.interval == 2) {
      secondtime = starttime.add(const Duration(hours: 12));
      _2ndtime = DateFormat('HH:mm a').format(secondtime);
    }
    if (medicine.interval == 3) {
      secondtime = starttime.add(const Duration(hours: 8));
      thirdtime = secondtime.add(const Duration(hours: 8));
      _2ndtime = DateFormat('HH:mm a').format(secondtime);
      _3rdtime = DateFormat('HH:mm a').format(thirdtime);
    }
    return Column(children: [
      Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        child: Container(
          padding: const EdgeInsets.all(16),
          //  width: SizeConfig.screenWidth * 0.78,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: _getBGClr(medicine.image ?? 0),
          ),
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 5),
                  height: 40,
                  width: 40,
                  child: _getImg(medicine.image ?? 0)),
              Text(
                "${medicine.name}",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Text(
                "${medicine.starttime}",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Text(
                "${medicine.interval}",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Text(
                "${medicine.date}",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Text(
                "${medicine.repet}",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  // _appBar() {
  //   return AppBar(
  //     elevation: 0,
  //     backgroundColor: context.theme.backgroundColor,
  //     leading: GestureDetector(
  //       onTap: () {
  //         ThemeServices().switchTheme();
  //         // notifyhelper.displayNotification(
  //         //   title: "Theme changed",
  //         //   body:
  //         //       Get.isDarkMode ? "Activated Dark mode" : "Activated Light mode",
  //         // );
  //         // notifyhelper.scheduledNotification();
  //       },
  //       child: Icon(
  //         Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
  //         size: 20,
  //         color: Get.isDarkMode ? Colors.white : Colors.black,
  //       ),
  //     ),
  //     actions: [
  //       IconButton(
  //         icon: Icon(
  //           Icons.settings,
  //           size: 20,
  //           color: Get.isDarkMode ? Colors.white : Colors.black,
  //         ),
  //         onPressed: () {
  //           Get.to(const Settings());
  //         },
  //       ),
  //       const SizedBox(
  //         width: 20,
  //       ),
  //     ],
  //   );
  // }

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
