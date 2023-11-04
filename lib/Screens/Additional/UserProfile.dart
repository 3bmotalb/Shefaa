// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Model/Home/textFormField.dart';

import '../../Model/AdditionalModel/EditProfileModel.dart';
import '../../themes.dart';

class EditUserProfile extends StatefulWidget {
  var store;
  EditUserProfile({Key? key, required this.store}) : super(key: key);

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: PrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
            // Get.to(const Settings());
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: h * .35,
              width: w,
              child: Stack(
                children: [
                  Container(
                    height: h * .2,
                    width: w,
                    decoration: BoxDecoration(
                      color: PrimaryColor,
                      borderRadius: BorderRadius.only(
                        // topLeft: Radius.circular(w * .25),
                        bottomLeft: Radius.circular(w * .07),
                        bottomRight: Radius.circular(w * .07),
                        // topRight: Radius.circular(w * .13),
                      ),
                    ),
                  ),
                  Positioned(
                    top: h * 0.08,
                    left: w * 0.3,
                    child: Column(children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.store!.image!),
                        radius: w * .2,
                      ),
                      TxtButton(
                        function: () {
                          //Upload Photo
                        },
                        txt: "_updatePhoto".tr,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * .02,
            ),
            EditProfileModel(
              store: widget.store,
            ),
            SizedBox(
              height: h * .02,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(DarkBlue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      // side: BorderSide(color: Colors.red),
                    ))),

                // backgroundColor: DarkBlue,

                onPressed: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: w * .4,
                  height: h * .07,
                  child: Text(
                    "_save".tr,
                    // textAlign: TextAlign.center,
                    // maxLines: 1,
                  ),
                )),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
