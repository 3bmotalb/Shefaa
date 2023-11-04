import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Model/AdditionalModel/settings.dart';
import 'package:graduation_project/themes.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          color: Colors.grey[200],
          onPressed: () {
            Get.back();
          },
        ),
        title: Text("_settings".tr),
      ),
      body: Container(
          alignment: Alignment.center,
          // color:  Colors.grey,
          padding: EdgeInsets.symmetric(horizontal: w * .01, vertical: h * .02),
          child: const MainSettings()),
    );
  }
}
