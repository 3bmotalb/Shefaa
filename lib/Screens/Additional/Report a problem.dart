import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/Home/Buttons.dart';
import '../../themes.dart';

class ReportAProblem extends StatelessWidget {
  const ReportAProblem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController reportProblemController = TextEditingController();
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        title: Text("_reportAProblem".tr),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: w * .05, vertical: h * .06),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: reportProblemController,
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: '_createReport'.tr,
                labelText: '_reportProblem'.tr,
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black87),
                    borderRadius: BorderRadius.circular(10)),
              ),
              style: const TextStyle(fontSize: 20),
              keyboardType: TextInputType.text,
              maxLines: 5,
            ),
            SizedBox(height: h * .1),
            FloatingActionButton.extended(
              onPressed: () {
                //////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
              },
              backgroundColor: PrimaryColor,
              label: Container(
                  alignment: Alignment.center,
                  width: w * .6,
                  child: Text(
                    "_reportProblem".tr,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
