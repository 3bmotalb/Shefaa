import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Model/Home/Address/Address.dart';
import 'package:graduation_project/Screens/UI_Sign/UI_Sign_Nurse/NurseUploads.dart';

import '../../../Model/Home/textFormField.dart';
import '../../../Model/Sign/UploadsModel.dart';
import '../../../themes.dart';

TextEditingController nurseInfo = TextEditingController();
// TextEditingController nurseEdu = TextEditingController();
// TextEditingController nurseProfessionalAffiliation = TextEditingController();
TextEditingController nurseEducationalQualification = TextEditingController();
TextEditingController anotherServices = TextEditingController();
final formKeyar = GlobalKey<FormState>();

class NurseInfoArabic extends StatefulWidget {
  const NurseInfoArabic({Key? key}) : super(key: key);

  @override
  State<NurseInfoArabic> createState() => _NurseInfoArabicState();
}

class _NurseInfoArabicState extends State<NurseInfoArabic> {
  // @override
  // void initState() {
  //   Get.updateLocale(const Locale('ar', 'ar'));
  //
  //   super.initState();
  //   print("initState");
  //
  // }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // _box.read('locale') == 'en' ? const Locale('en') : const Locale('en');

    return Scaffold(
      appBar: AppBar(
          title: Text(
            "_competeProfile".tr,
            style: const TextStyle(fontSize: 18),
          ),
          backgroundColor: PrimaryColor,
          elevation: 4,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            TxtButton(
              txt: "_continue".tr,
              function: () {
                if (formKeyar.currentState!.validate() &&
                    professionalTitleValue != null &&
                    selectedItemsService.isNotEmpty &&
                    selectedItemslang.isNotEmpty &&
                    selectedItemstimes.isNotEmpty &&
                    selectedItemswork.isNotEmpty &&
                    selected!=null &&
                    citystore.isNotEmpty &&
                    governmentstore.isNotEmpty) {
                  formKeyar.currentState!.save();
                  Get.to(const NurseEnglishInfo());
                } else {
                  Get.snackbar(
                    "_error".tr,
                    "Please fill all the fields",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: const Color(0xFFB20600),
                    duration: const Duration(seconds: 2),
                  );
                }
              },
            ),
          ]),
      body: SingleChildScrollView(
        child: Container(
          // width: w,
          // height: h,
          padding: EdgeInsets.all(w * .01),
          margin: EdgeInsets.symmetric(horizontal: w * .01, vertical: h * .06),
          child: Form(
            key: formKeyar,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.down,
              children: [
                Text(
                  "_arabicProfileTxt".tr,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFFD57E7E),
                      fontWeight: FontWeight.w800),
                ),

                SizedBox(
                  height: h * .04,
                ),
                Text(
                  "_aboutNurse".tr,
                  style: SignTitles,
                ),
                SizedBox(
                  height: h * .01,
                ),

                MultiLineTextField(controller: nurseInfo),
                SizedBox(
                  height: h * .05,
                ),
                Text(
                  '_professionalTitle'.tr,
                  style: SignTitles,
                ),
                SizedBox(
                  height: h * .01,
                ),

                const NurseProfessionalTittle(),
                SizedBox(
                  height: h * .05,
                ),

                // Text(
                //   "_professionalAffiliation".tr,
                //   style: SignTitles,
                // ),
                // MultiLineTextField(
                //   controller: nurseProfessionalAffiliation,
                //   hint: "_professionalAffiliationNote".tr,
                // ),

                SizedBox(
                  height: h * .05,
                ),

                Text(
                  "_nurseServices".tr,
                  style: SignTitles,
                ),
                SizedBox(
                  height: h * .02,
                ),
                const NurseServices(),
                SizedBox(
                  height: h * .06,
                ),
                Text(
                  "_anyServices".tr,
                  style: SignTitles,
                ),
                SizedBox(
                  height: h * .02,
                ),

                MultiLineTextField(
                  controller: anotherServices,
                ),
                SizedBox(
                  height: h * .03,
                ),

                Text(
                  "_educationalQualification".tr,
                  style: SignTitles,
                ),
                SizedBox(
                  height: h * .01,
                ),
                MultiLineTextField(
                  controller: nurseEducationalQualification,
                ),

                SizedBox(
                  height: h * .05,
                ),

                Text(
                  "_spokenLan".tr,
                  style: SignTitles,
                ),
                SizedBox(
                  height: h * .02,
                ),

                const SpokenLan(),
                SizedBox(
                  height: h * .05,
                ),

                Text(
                  "_availableTime".tr,
                  style: SignTitles,
                ),
                SizedBox(
                  height: h * .02,
                ),

                const DocAvailableTime(),
                SizedBox(
                  height: h * .06,
                ),
                // Text(
                //   "_examinationFees".tr,
                //   style: SignTitles,
                // ),
                // SizedBox(
                //   height: h * .02,
                // ),
                //
                // const ExaminationFees(),
                // SizedBox(
                //   height: h * .05,
                // ),
                Text(
                  "_workArea".tr,
                  style: SignTitles,
                ),
                SizedBox(
                  height: h * .02,
                ),

                const Address(),
                Divider(
                  indent: w * .03,
                  endIndent: w * .03,
                  thickness: 1,
                  height: h * .04,
                  color: Get.isDarkMode
                      ? const Color(0xFF181818)
                      : Colors.grey[700],
                ),
                Text(
                  "_workingPlace".tr,
                  style: SignTitles,
                ),
                SizedBox(
                  height: h * .02,
                ),

                const NurseWorkIn(),
                Divider(
                  indent: w * .03,
                  endIndent: w * .03,
                  thickness: 1,
                  height: h * .04,
                  color: Get.isDarkMode
                      ? const Color(0xFF181818)
                      : Colors.grey[700],
                ),

                Text(
                  "_graduationDate".tr,
                  style: SignTitles,
                ),
                SizedBox(
                  height: h * .02,
                ),

                const PickYear(),
                Divider(
                  indent: w * .03,
                  endIndent: w * .03,
                  thickness: 1,
                  height: h * .04,
                  color: Get.isDarkMode
                      ? const Color(0xFF181818)
                      : Colors.grey[700],
                ),

                // Text(
                //   "_haveClinic?".tr,
                //   style: SignTitles,
                // ),
                // const HaveClinic(),
                // Divider(
                //   indent: w * .03,
                //   endIndent: w * .03,
                //   thickness: 1,
                //   height: h * .04,
                //   color:
                //   Get.isDarkMode ? const Color(0xFF181818) : Colors.grey[700],
                // ),

                // Text(
                //   "_workInHospital".tr,
                //   style: SignTitles,
                // ),
                // const Hospital(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextEditingController nurseInfoE = TextEditingController();
// TextEditingController nurseProfessionalAffiliationE = TextEditingController();
TextEditingController anotherServicesE = TextEditingController();
TextEditingController nurseEducationalQualificationE = TextEditingController();
final formKeyen = GlobalKey<FormState>();

class NurseEnglishInfo extends StatefulWidget {
  const NurseEnglishInfo({Key? key}) : super(key: key);

  @override
  State<NurseEnglishInfo> createState() => _NurseEnglishInfoState();
}

class _NurseEnglishInfoState extends State<NurseEnglishInfo> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          title: Text(
            "_competeProfile".tr,
            style: const TextStyle(fontSize: 18),
          ),
          backgroundColor: PrimaryColor,
          elevation: 4,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            TxtButton(
                txt: "_continue".tr,
                function: () {
                  if (formKeyen.currentState!.validate()) {
                    Get.to(const NurseFiles());
                  } else {
                    Get.snackbar(
                      '_error'.tr,
                      '_pleaseFillAllFields'.tr,
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      borderRadius: 8,
                      margin: const EdgeInsets.all(8),
                      snackStyle: SnackStyle.FLOATING,
                      duration: const Duration(seconds: 2),
                      icon: const Icon(
                        Icons.error,
                        color: Colors.white,
                      ),
                    );
                  }
                }),
          ]),
      body: SingleChildScrollView(
        child: Container(
          // width: w,
          // height: h,
          padding: EdgeInsets.all(w * .01),
          margin: EdgeInsets.symmetric(horizontal: w * .01, vertical: h * .06),
          child: Form(
            key: formKeyen,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.down,
              children: [
                Text(
                  "_englishProfileTxt".tr,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFFD57E7E),
                      fontWeight: FontWeight.w800),
                ),

                SizedBox(
                  height: h * .04,
                ),
                Text(
                  "_aboutNurse".tr,
                  style: SignTitles,
                ),
                SizedBox(
                  height: h * .01,
                ),

                MultiLineTextField(controller: nurseInfoE),
                // SizedBox(
                //   height: h * .05,
                // ),
                // Text(
                //   "_professionalAffiliation".tr,
                //   style: SignTitles,
                // ),
                // MultiLineTextField(
                //   controller: nurseProfessionalAffiliationE,
                //   hint: "_professionalAffiliationNote".tr,
                // ),

                SizedBox(
                  height: h * .06,
                ),
                Text(
                  "_anyServices".tr,
                  style: SignTitles,
                ),
                SizedBox(
                  height: h * .01,
                ),

                MultiLineTextField(
                  controller: anotherServicesE,
                ),
                SizedBox(
                  height: h * .03,
                ),
                Text(
                  "_educationalQualification".tr,
                  style: SignTitles,
                ),
                SizedBox(
                  height: h * .01,
                ),
                MultiLineTextField(
                  controller: nurseEducationalQualificationE,
                ),
                SizedBox(
                  height: h * .05,
                ),

                // Divider(
                //   indent: w * .03,
                //   endIndent: w * .03,
                //   thickness: 1,
                //   height: h * .04,
                //   color:
                //       Get.isDarkMode ? const Color(0xFF181818) : Colors.grey[700],
                // ),

                // Text(
                //   "_workInHospital".tr,
                //   style: SignTitles,
                // ),
                // const Hospital(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
