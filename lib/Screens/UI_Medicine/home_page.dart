// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Controlers/C_Medicine/medicine_contoller.dart';
import '../../Model/M_Medicine/button.dart';
import '../../Model/M_Medicine/medicine.dart';
import '../../Model/M_Medicine/medicine_title.dart';
import '../../Services/S_Medicine/notification_service.dart';
import '../../local/locale_controller.dart';
import '../../themes.dart';
import 'add_med_page.dart';
import 'medicine_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

var notifyhelper;
var theme;
MylocaleController locale = Get.put(MylocaleController());

class _HomePageState extends State<HomePage> {
  DateTime _SelectedDate = DateTime.now();
  final _medicineContoller = Get.put(MedicineContoller());

  @override
  void initState() {
    super.initState();
    notifyhelper = NotifyHelper();
    theme = Themes();
    _medicineContoller.getMedicines();
    notifyhelper.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(),
      body: Column(children: [
        _addtaskbar(),
        _adddatebar(),
        const SizedBox(height: 10),
        _showmedicines(),
      ]),
    );
  }

  _showmedicines() {
    return Expanded(child: Obx(() {
      return ListView.builder(
          itemCount: _medicineContoller.medicinelist.length,
          itemBuilder: (_, i) {
            Medicine medicine = _medicineContoller.medicinelist[i];

            if (medicine.repet == 'يوميا') {
              DateTime date =
                  DateFormat.jm().parse(medicine.starttime.toString());
              var mytime = DateFormat('HH:mm').format(date);
              notifyhelper.scheduledNotification(
                  int.parse(mytime.toString().split(":")[0]),
                  int.parse(mytime.toString().split(":")[01]),
                  medicine);
              return AnimationConfiguration.staggeredList(
                position: i,
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showBottemSheet(context, medicine);
                          },
                          child: MedicineTile(medicine),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else if (medicine.date ==
                DateFormat.yMd().format(_SelectedDate)) {
              DateTime date =
                  DateFormat.jm().parse(medicine.starttime.toString());
              var mytime = DateFormat('HH:mm').format(date);
              notifyhelper.scheduledNotification(
                  int.parse(mytime.toString().split(":")[0]),
                  int.parse(mytime.toString().split(":")[01]),
                  medicine);
              return AnimationConfiguration.staggeredList(
                position: i,
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showBottemSheet(context, medicine);
                          },
                          child: MedicineTile(medicine),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          });
    }));
  }

  _showBottemSheet(BuildContext context, Medicine medicine) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 5),
        height: medicine.iscompleted == 1
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.height * 0.35,
        color: Get.isDarkMode ? darkGreyClr : Colors.white,
        child: Column(
          children: [
            Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300]),
            ),
            medicine.iscompleted == 1
                ? Container()
                : _BottomSheetButton(
                    label: '_medinfo'.tr,
                    onTap: () {
                      _medicineContoller.getMedicinedata(medicine.id!);
                      Get.defaultDialog(
                          title: '_medinfo'.tr,
                          content: MedicineInfo(medicine.id!));
                    },
                    clr: primaryClr,
                    context: context),
            _BottomSheetButton(
                label: '_meddelete'.tr,
                onTap: () {
                  _medicineContoller.delete(medicine);
                  Get.back();
                },
                clr: Colors.red[300]!,
                context: context),
            const SizedBox(
              height: 15,
            ),
            _BottomSheetButton(
                label: '_medclose'.tr,
                onTap: () {
                  Get.back();
                },
                clr: Colors.white,
                isclose: true,
                context: context),
          ],
        ),
      ),
    );
  }

  _BottomSheetButton(
      {required String label,
      required Function()? onTap,
      required Color clr,
      bool isclose = false,
      required BuildContext context}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 65,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isclose == true ? Colors.grey[300]! : clr,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isclose == true ? Colors.transparent : clr,
        ),
        child: Center(
          child: Text(
            label,
            style:
                isclose ? TitleStyle : TitleStyle.copyWith(color: Colors.white),
          ),
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
        initialSelectedDate: DateTime.now(),
        selectionColor: DarkBlue,
        selectedTextColor: Colors.white,
        onDateChange: (date) {
          setState(() {
            _SelectedDate = date;
          });
        },
        dateTextStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
        ),
        dayTextStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
        ),
        monthTextStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
        ),
        daysCount: 30,
      ),
    );
  }

  _addtaskbar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Button(
            label: '_addmed'.tr,
            onTap: () async {
              await Get.to(const AddMed());
              _medicineContoller.getMedicines();
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                DateFormat.yMMMMd(locale.initiallocale.languageCode)
                    .format(DateTime.now()),
                style: subHeadingStyle,
              ),
              Text(
                '_today'.tr,
                style: HeadingStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
          // ThemeServices().switchTheme();
          // notifyhelper.displayNotification(
          //   title: "Theme changed",
          //   body:
          //       Get.isDarkMode ? "Activated Dark mode" : "Activated Light mode",
          // );
          // notifyhelper.scheduledNotification();
        },
        child: Icon(
          Icons.arrow_back,
          size: 25,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: const [
        // IconButton(
        //   icon: Icon(
        //     Icons.settings,
        //     size: 20,
        //     color: Get.isDarkMode ? Colors.white : Colors.black,
        //   ),
        //   onPressed: () {
        //     Get.to(const Settings());
        //   },
        // ),
        // const SizedBox(
        //   width: 20,
        // ),
      ],
    );
  }
}
