import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_Appointment/appointment_controller.dart';
import 'package:graduation_project/Model/M_Medicine/input_field.dart';
import 'package:graduation_project/themes.dart';
import 'package:intl/intl.dart';

class AddApp extends StatefulWidget {
  const AddApp({Key? key}) : super(key: key);

  @override
  State<AddApp> createState() => _AddAppState();
}

DateTime _selectedate = DateTime.now();
String _starttime = DateFormat("hh:mm a").format(DateTime.now()).toString();
final appcontoller = Get.put(Appcontroller());
TextEditingController pricecontroller = TextEditingController();

class _AddAppState extends State<AddApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: Text('_AddAppointment'.tr),
          backgroundColor: PrimaryColor,
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(5),
            child: Column(children: [
              InputField(
                title: '_Date'.tr,
                hint: DateFormat.yMd().format(_selectedate),
                widget: IconButton(
                  icon: const Icon(Icons.calendar_today_outlined),
                  onPressed: () {
                    _getDateFromUser();
                  },
                ),
              ),
              InputField(
                title: '_Time'.tr,
                hint: _starttime,
                widget: IconButton(
                  onPressed: () {
                    _getTimeFromUser();
                  },
                  icon: const Icon(Icons.access_time_rounded),
                ),
              ),
              InputField(
                title: '_Price'.tr,
                hint: '_EnterPrice'.tr,
                widget: null,
                number: true,
                controller: pricecontroller,
              ),
              MaterialButton(
                onPressed: () {
                  appcontoller.addappoitment(
                      FirebaseAuth.instance.currentUser!.uid,
                      _selectedate,
                      _starttime,
                      int.parse(pricecontroller.text));
                  pricecontroller.text = "";
                  _selectedate = DateTime.now();
                  _starttime =
                      DateFormat("hh:mm a").format(DateTime.now()).toString();
                },
                child: Text('_AddAppointment'.tr),
                color: Colors.blue,
              )
            ]),
          ),
        ));
  }

  _getDateFromUser() async {
    DateTime? _pickDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2023),
    );

    if (_pickDate != null) {
      setState(() {
        _selectedate = _pickDate;
      });
    } else {}
  }

  _getTimeFromUser() async {
    String? _formatedtime;
    TimeOfDay? _pickTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(_starttime.split(":")[0]),
        minute: int.parse(_starttime.split(":")[1].split(" ")[0]),
      ),
    );
    if (_pickTime != null) {
      _formatedtime = _pickTime.format(context);
    } else {}

    if (_pickTime != null) {
      setState(() {
        _starttime = _formatedtime!;
      });
    } else {}
  }
}
