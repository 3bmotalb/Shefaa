// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/DB/Models/M_Appointment/Appointment.dart';
import 'package:graduation_project/DB/Models/M_nurse/nurse_controller.dart';
import 'package:graduation_project/DB/Models/M_user/usercontroler.dart';
import 'package:graduation_project/DB/functions.dart';
import 'package:graduation_project/Model/Sign/UploadsModel.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/navigationbar.dart';
import 'package:graduation_project/themes.dart';
//import 'package:grade1/components/input_filed.dart';

class nursebook extends StatefulWidget {
  appointment app;
  nursebook({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<nursebook> createState() => _nursebookState();
}

TextEditingController controllerdetails = TextEditingController();
TextEditingController controlleraddress = TextEditingController();
GlobalKey<FormState> _formkey = GlobalKey<FormState>();
UserControler userControler = Get.put(UserControler());
NurseController nurseController = Get.put(NurseController());

NurseController nurse = Get.put(NurseController());
List<String>? services;
List<String> ServicesSelected = [];

class _nursebookState extends State<nursebook> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    services = nurse.nursestore!.services!.cast<String>();
    print(services);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          title: Text('_requestdetails'.tr,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('_Date'.tr + ' : ',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        functions().Change_Date_Format(widget.app.date!),
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text("_Time".tr + ' : ',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(functions().replaceFarsiNumber(widget.app.time!),
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text('_priceper'.tr + ' : ',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                          functions()
                              .replaceFarsiNumber(widget.app.price.toString()),
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          Text(
                            '_Details'.tr,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            controller: controllerdetails,
                            minLines: 2,
                            maxLines: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(height: 10),
                          const SizedBox(height: 10),
                          Column(
                            children: [
                              Text(
                                '_addressdetails'.tr,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: '_addressNote'.tr,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                controller: controlleraddress,
                                minLines: 1,
                                maxLines: 4,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // use this button to open the multi-select dialog
                              SizedBox(
                                height: h * .1,
                                width: w * .95,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    primary: const Color(0xFF387C6D),
                                    side: const BorderSide(
                                        color: darkGreyClr, width: 1),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '_nurseServicesselect'.tr,
                                        style: TextStyle(
                                            color: Get.isDarkMode
                                                ? PrimaryColor
                                                : PrimaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      const Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                  onPressed: _showMultiSelect,
                                ),
                              ),
                              Divider(
                                height: h * .01,
                              ),
                              // display selected items
                              Wrap(
                                children: ServicesSelected.map((e) => Chip(
                                      label: Text(e),
                                    )).toList(),
                              )
                            ],
                          ),
                        ],
                      )),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        if (_formkey.currentState!.validate() &&
                            ServicesSelected.isNotEmpty) {
                          _formkey.currentState!.save();
                          print(controlleraddress.text);
                          await sendRequesttofb(controlleraddress.text,
                              controllerdetails.text, ServicesSelected);
                          controlleraddress.clear();
                          controllerdetails.clear();
                        }
                      },
                      icon: const Icon(Icons.phone),
                      label: Text('_Booking'.tr),
                      style: ElevatedButton.styleFrom(
                          //minimumSize: Size(40, 40),
                          primary: PrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  void _showMultiSelect() async {
    // a list of selectable items
    final List<String> _items = services!;
    _items.insert(_items.length, 'اخري');

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        ServicesSelected = results;
        print('////////////////////');
        print(ServicesSelected);
      });
    } else {
      print('empty');
    }
  }

  sendRequesttofb(String address, String details, List<String> selected) async {
    try {
      DocumentReference reference =
          await FirebaseFirestore.instance.collection('request').add({
        'userid': FirebaseAuth.instance.currentUser!.uid,
        'nurseid': nurseController.nursestore!.userid,
        'appointment_id': widget.app.id,
        'createdAt': DateTime.now(),
        'status': 'Pending',
        'details': details,
        'address': address +
            ' ' +
            userControler.user!.cityname! +
            ' - ' +
            userControler.user!.governmentname!,
        'services': selected,
      });
      Get.snackbar(
        'Success',
        'Your Request has been sent',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );

      Get.offAll(const homepagenavigation());
    } catch (e) {
      Get.defaultDialog(
        title: 'fail',
        middleText: 'request failed',
      );
    }
  }

  Column txtfield(String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.lato(
              textStyle: const TextStyle(
            fontSize: 16,
          )),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600])),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                  width: 0,
                )),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey,
                  width: 0,
                ))),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
