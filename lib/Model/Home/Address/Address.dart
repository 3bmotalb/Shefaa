// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation_project/Model/Home/Address/AddressModel2.dart';
import 'package:graduation_project/Model/Home/textFormField.dart';
import 'package:graduation_project/main.dart';
import 'dart:async';
import 'dart:convert';
import '../../../themes.dart';
import 'package:get/get.dart';

import 'addresscontroller.dart';

String citystore = "";
String governmentstore = "";
String? cityName, governorateName;

// class SelectCountry {
//   int? id;
//   String? tittle;
//   Function? function;
//
//   SelectCountry({this.id, this.tittle, this.function});
// }

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

addcontroller controller = Get.put(addcontroller());

class _AddressState extends State<Address> {

  List governoratesList = [];

  // List countriesList = [];
  List citiesList = [];
  List tempList = [];
  String? _governorate;
  String? _city;

  // String? _country;
  bool _isVisible = true;

  // var items = ["Egypt", "Other"];

  // Color clrContainer=Color(0xFFFCECDD);
  //
  // _SelectCountry(){
  //   return;
  // }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    // List<SelectCountry> countryy = [
    //   SelectCountry(
    //       id: 0,
    //       tittle: "_egypt".tr,
    //       function: () {
    //         _isVisible = !_isVisible;
    //       }),
    //   SelectCountry(
    //       id: 1,
    //       tittle: "_other".tr,
    //       function: () {
    //         _isVisible = false;
    //       }),
    // ];

    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: w * .02, vertical: h * .02),
      // decoration: const BoxDecoration(
      //     // border: Border.all(),
      //     ),
      child: Column(
        children: [
          _isVisible == true
              ? ListTile(
                  leading: Image.asset(
                    "assets/images/Egypt.jpg",
                    height: h * .045,
                    width: w * .15,
                  ),
                  title: Text(
                    "_egypt".tr,
                    style: SignTitles,
                  ),
                  trailing: TxtButton(
                    txt: "_change".tr,
                    function: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                backgroundColor:
                                    Get.isDarkMode ? darkGreyClr : white,
                                actionsOverflowDirection: VerticalDirection.up,
                                actionsAlignment: MainAxisAlignment.start,
                                actions: <Widget>[
                                  Column(
                                    children: [
                                      TxtButton(
                                        txt: "_egypt".tr,
                                        function: () {
                                          setState(() {
                                            _isVisible = true;
                                          });
                                          // ThemeServices().switchTheme();
                                          // notifyhelper.displayNotification(
                                          //     title: "Theme changed", body: "Activated mode");
                                          Get.back();
                                        },
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,

                                            color: Get.isDarkMode ? white : darkGreyClr),
                                      ),
                                      TxtButton(
                                        txt: "_other".tr,
                                        function: () {
                                          setState(() {
                                            _isVisible = false;
                                          });
                                          Get.back();
                                        },
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,

                                            color: Get.isDarkMode ? white : darkGreyClr),
                                      )
                                    ],
                                  ),
                                ],
                              ));
                    },
                  ),
                )
              : ListTile(
                  // leading:Image.asset("assets/images/Egypt.jpg",height: h*.045,width: w*.15,),
                  title: Text(
                    "_other".tr,
                    style: SignTitles,
                  ),
                  trailing: TxtButton(
                    txt: "change",
                    function: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                backgroundColor:
                                    Get.isDarkMode ? darkGreyClr : white,
                                actionsOverflowDirection: VerticalDirection.up,
                                actionsAlignment: MainAxisAlignment.start,
                                actions: <Widget>[
                                  Column(
                                    children: [
                                      TxtButton(
                                        txt: "_egypt".tr,
                                        function: () {
                                          setState(() {
                                            _isVisible = true;
                                          });
                                          // ThemeServices().switchTheme();
                                          // notifyhelper.displayNotification(
                                          //     title: "Theme changed", body: "Activated mode");
                                          Get.back();
                                        },
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,

                                            color: Get.isDarkMode ? white : darkGreyClr),
                                      ),
                                      TxtButton(
                                        txt: "_other".tr,
                                        function: () {
                                          setState(() {
                                            _isVisible = false;
                                          });
                                          Get.back();
                                        },
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,

                                            color: Get.isDarkMode ? white : darkGreyClr),
                                      )
                                    ],
                                  ),
                                ],
                              ));
                    },
                  ),
                ),
          Visibility(
            visible: _isVisible,
            child: Column(
              children: [
                box.read('locale') == 'en' || box.read('locale') == null
                    ? DropdownButton(
                        isExpanded: true,
                        items: governoratesList.map((item) {
                          return DropdownMenuItem(
                            child: Text(item.nameEn),
                            value: item.id.toString(),
                            onTap: () => governorateName = item.nameEn,
                          );
                        }).toList(),
                        onChanged: (String? newVal) {
                          setState(() {
                            _city = null;
                            _governorate = newVal;
                            governmentstore = newVal!;
                            tempList = citiesList
                                .where((x) =>
                                    x.govId.toString() ==
                                    (_governorate.toString()))
                                .toList();
                            controller.changegov(
                                governorateName!, int.parse(_governorate!));
                            // print(_governorate);
                            //
                            // _city = null;
                            // _governorate = newVal;
                            // governmentstore = newVal!;
                            // tempList = citiesList
                            //     .where((x) =>
                            // x.govId.toString() == (_governorate.toString()))
                            //     .toList();
                            // print(governorateName);
                          });
                        },
                        value: _governorate,
                        hint: Text('_selectYourGovernorate'.tr),
                      )
                    : DropdownButton(
                        isExpanded: true,
                        items: governoratesList.map((item) {
                          return DropdownMenuItem(
                            child: Text(item.nameAr),
                            value: item.id.toString(),
                            onTap: () => governorateName = item.nameAr,
                          );
                        }).toList(),
                        onChanged: (String? newVal) {
                          setState(() {
                            _city = null;
                            _governorate = newVal;
                            governmentstore = newVal!;
                            tempList = citiesList
                                .where((x) =>
                                    x.govId.toString() ==
                                    (_governorate.toString()))
                                .toList();
                            controller.changegov(
                                governorateName!, int.parse(_governorate!));
                            // print(_governorate);
                            //
                            // _city = null;
                            // _governorate = newVal;
                            // governmentstore = newVal!;
                            // tempList = citiesList
                            //     .where((x) =>
                            // x.govId.toString() == (_governorate.toString()))
                            //     .toList();
                            // print(governorateName);
                          });
                        },
                        value: _governorate,
                        hint: Text('_selectYourGovernorate'.tr),
                      ),
                box.read('locale') == 'en' || box.read('locale') == null
                    ? DropdownButton(
                        isExpanded: true,
                        items: tempList.map((item) {
                          return DropdownMenuItem(
                            child: Text(item.nameEn),
                            value: item.id.toString(),
                            onTap: () {
                              cityName = item.nameEn;
                            },
                          );
                        }).toList(),
                        onChanged: (String? newVal) {
                          setState(() {
                            _city = newVal;
                            citystore = _city!;
                          });
                          controller.changecity(cityName!, int.parse(_city!));
                          // print(_city);
                        },
                        value: _city,
                        hint: Text('_selectYourCity'.tr),
                      )
                    : DropdownButton(
                        isExpanded: true,
                        items: tempList.map((item) {
                          return DropdownMenuItem(
                            child: Text(item.nameAr),
                            value: item.id.toString(),
                            onTap: () {
                              cityName = item.nameAr;
                            },
                          );
                        }).toList(),
                        onChanged: (String? newVal) {
                          setState(() {
                            _city = newVal;
                            citystore = _city!;
                          });
                          controller.changecity(cityName!, int.parse(_city!));
                          // print(_city);
                        },
                        value: _city,
                        hint: Text('_selectYourCity'.tr),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future loadStatesProvincesFromFile() async {
    return await rootBundle.loadString('assets/json/places.json');
  }

  Future _populateDropdown() async {
    String getPlaces = await loadStatesProvincesFromFile();
    final jsonResponse = json.decode(getPlaces);

    Localization places = Localization.fromJson(jsonResponse);

    setState(() {
      governoratesList = places.governorates!;
      citiesList = places.cities!;
    });
  }

  @override
  void initState() {
    super.initState();
    _populateDropdown();
  }
}
