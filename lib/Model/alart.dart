// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation_project/Screens/UI_Doctor_Services/HomePage_Doctor.dart';
import 'package:graduation_project/main.dart';

import '../Screens/UI_Home/Drawer.dart';
import '../Screens/UI_Home/MainScreen.dart';
import '../Screens/UI_Nurse_Service/nursenaviationbar.dart';
import '../themes.dart';
import 'Home/textFormField.dart';

loading(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("please wait"),
          content: SizedBox(
            height: 50,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      });
      
}

 warning(context) {
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                      backgroundColor:
                                          Get.isDarkMode ? darkGreyClr : white,
                                      actionsOverflowDirection:
                                          VerticalDirection.up,
                                      actionsAlignment: MainAxisAlignment.start,
                                      content: Text(
                                        "_requestSaved".tr,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                            color: Get.isDarkMode
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                      title: Text(
                                        "_requestSuccess".tr,
                                        style: SignTitles,
                                      ),
                                      // content: Text("You have raised a Alert Dialog Box"),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TxtButton(
                                              txt: "_exit".tr,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Get.isDarkMode
                                                      ? white
                                                      : darkGreyClr),
                                              function: () {
                                                //////////////////////
                                                if(box.read('type')=='nurse') {
                                                  Get.offAll(const nursehomepagenavigation());
                                                } else if(box.read('type')=='doctor') {
                                                  Get.offAll(HomePage2_d());
                                                }
                                              },
                                            ),
                                          ],
                                        )
                                      ]));
                        }
