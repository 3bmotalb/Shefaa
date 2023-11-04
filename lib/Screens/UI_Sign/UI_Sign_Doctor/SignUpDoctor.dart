import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Model/Home/Address/Address.dart';
import 'package:graduation_project/Model/Home/textFormField.dart';
import 'package:graduation_project/Screens/UI_Sign/UI_Sign_Doctor/DoctorUploads.dart';

import '../../../Model/Sign/UploadsModel.dart';
import '../../../themes.dart';

class DoctorInfoArabic extends StatefulWidget {
  const DoctorInfoArabic({Key? key}) : super(key: key);

  @override
  State<DoctorInfoArabic> createState() => _DoctorInfoArabicState();
}

TextEditingController doctorInfoar = TextEditingController();

TextEditingController doctorEduar = TextEditingController();
TextEditingController professionalTitlear = TextEditingController();
TextEditingController educationalQualificationar = TextEditingController();
final formKeyar = GlobalKey<FormState>();

class _DoctorInfoArabicState extends State<DoctorInfoArabic> {
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
                    if (formKeyar.currentState!.validate()&&
                        professionalTitleValuedoc != null &&
                        selectedItemslang.isNotEmpty &&
                        selected != null &&
                        citystore.isNotEmpty &&
                        governmentstore.isNotEmpty
                        ) {
                      Get.to(const DoctorEnglishInfo());
                    } else {
                      Get.snackbar(
                        '_error'.tr,
                        '_pleaseFillAllFields'.tr,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: const Color(0xFFB20600),
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
            margin:
                EdgeInsets.symmetric(horizontal: w * .01, vertical: h * .06),
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
                  // file == null
                  //     ? imgProfilepicker(context)
                  //     : cancelimage(h, w, context),
                  SizedBox(
                    height: h * .04,
                  ),
                  Text(
                    "_aboutDoc".tr,
                    style: SignTitles,
                  ),
                  SizedBox(
                    height: h * .01,
                  ),

                  MultiLineTextField(controller: doctorInfoar),
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

                  const ProfessionalTittle(),
                  SizedBox(
                    height: h * .05,
                  ),

                  Text(
                    '_professionalTitledetails'.tr,
                    style: SignTitles,
                  ),
                  MultiLineTextField(
                    controller: professionalTitlear,
                    hint: "_professionalTitledetailsNote".tr,
                  ),

                  SizedBox(
                    height: h * .05,
                  ),

                  Text(
                    "_mainSpecialise".tr,
                    style: SignTitles,
                  ),
                  SizedBox(
                    height: h * .02,
                  ),

                  const DocSpecialises(),
                  SizedBox(
                    height: h * .03,
                  ),
                  // Text(
                  //   "_subSpecialise".tr,
                  //   style: SignTitles,
                  // ),
                  // SizedBox(
                  //   height: h * .01,
                  // ),

                  // Text(
                  //   "_subSpecialiseNote".tr,
                  //   style: GoogleFonts.lato(
                  //       textStyle: TextStyle(
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.bold,
                  //     color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
                  //   )),
                  // ),
                  // SizedBox(
                  //   height: h * .02,
                  // ),

                  // const DocSubSpecialises(),
                  SizedBox(
                    height: h * .03,
                  ),

                  Text(
                    '_professionalAffiliation'.tr,
                    style: SignTitles,
                  ),
                  SizedBox(
                    height: h * .01,
                  ),
                  MultiLineTextField(
                    controller: educationalQualificationar,
                    hint: '_professionalAffiliationNote'.tr,
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

                  // Text(
                  //   "_availableTime".tr,
                  //   style: SignTitles,
                  // ),
                  // SizedBox(
                  //   height: h * .02,
                  // ),

                  // const DocAvailableTime(),
                  // SizedBox(
                  //   height: h * .06,
                  // ),
                  // Text(
                  //   "_examinationFees".tr,
                  //   style: SignTitles,
                  // ),
                  // SizedBox(
                  //   height: h * .02,
                  // ),

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
                  const HaveClinic(),
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
                  //   "_workInHospital".tr,
                  //   style: SignTitles,
                  // ),
                  // const Hospital(),
                  // Divider(
                  //   indent: w * .03,
                  //   endIndent: w * .03,
                  //   thickness: 1,
                  //   height: h * .04,
                  //   color: Get.isDarkMode
                  //       ? const Color(0xFF181818)
                  //       : Colors.grey[700],
                  // ),
                ],
              ),
            ),
          ),
        ));
  }
}

class DoctorEnglishInfo extends StatefulWidget {
  const DoctorEnglishInfo({Key? key}) : super(key: key);

  @override
  State<DoctorEnglishInfo> createState() => _DoctorEnglishInfoState();
}

TextEditingController doctorInfoen = TextEditingController();

TextEditingController doctorEduen = TextEditingController();
TextEditingController professionalTitleen = TextEditingController();
TextEditingController educationalQualificationen = TextEditingController();
final formKeyen = GlobalKey<FormState>();

class _DoctorEnglishInfoState extends State<DoctorEnglishInfo> {
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
                    if (formKeyen.currentState!.validate()) {
                      Get.to(const DoctorFiles());
                    } else {
                      Get.snackbar(
                        '_error'.tr,
                        '_pleaseFillAllFields'.tr,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: const Color(0xFFB20600),
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
            margin:
                EdgeInsets.symmetric(horizontal: w * .01, vertical: h * .06),
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
                  // file == null
                  //     ? imgProfilepicker(context)
                  //     : cancelimage(h, w, context),
                  SizedBox(
                    height: h * .04,
                  ),
                  Text(
                    "_aboutDoc".tr,
                    style: SignTitles,
                  ),
                  SizedBox(
                    height: h * .01,
                  ),

                  MultiLineTextField(controller: doctorInfoen),
                  SizedBox(
                    height: h * .05,
                  ),
                  // Text(
                  //   '_professionalTitle'.tr,
                  //   style: SignTitles,
                  // ),
                  // SizedBox(
                  //   height: h * .01,
                  // ),
                  //
                  // const ProfessionalTittle(),
                  // SizedBox(
                  //   height: h * .05,
                  // ),

                  Text(
                    '_professionalTitledetails'.tr,
                    style: SignTitles,
                  ),
                  MultiLineTextField(
                    controller: professionalTitleen,
                    hint: "_professionalTitledetailsNote".tr,
                  ),

                  SizedBox(
                    height: h * .05,
                  ),

                  // Text(
                  //   "_mainSpecialise".tr,
                  //   style: SignTitles,
                  // ),
                  // SizedBox(
                  //   height: h * .02,
                  // ),
                  //
                  // const DocSpecialises(),
                  // SizedBox(
                  //   height: h * .03,
                  // ),
                  // Text(
                  //   "_subSpecialise".tr,
                  //   style: SignTitles,
                  // ),
                  // SizedBox(
                  //   height: h * .01,
                  // ),

                  // Text(
                  //   "_subSpecialiseNote".tr,
                  //   style: GoogleFonts.lato(
                  //       textStyle: TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.bold,
                  //         color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
                  //       )),
                  // ),
                  // SizedBox(
                  //   height: h * .02,
                  // ),
                  //
                  // const DocSubSpecialises(),
                  // SizedBox(
                  //   height: h * .03,
                  // ),

                  Text(
                    '_professionalAffiliation'.tr,
                    style: SignTitles,
                  ),
                  SizedBox(
                    height: h * .01,
                  ),
                  MultiLineTextField(
                    controller: educationalQualificationen,
                    hint: '_professionalAffiliationNote'.tr,
                  ),

                  SizedBox(
                    height: h * .05,
                  ),

                  // Text(
                  //   "_spokenLan".tr,
                  //   style: SignTitles,
                  // ),
                  // SizedBox(
                  //   height: h * .02,
                  // ),
                  //
                  // const SpokenLan(),
                  // SizedBox(
                  //   height: h * .05,
                  // ),

                  // Text(
                  //   "_availableTime".tr,
                  //   style: SignTitles,
                  // ),
                  // SizedBox(
                  //   height: h * .02,
                  // ),

                  // const DocAvailableTime(),
                  // SizedBox(
                  //   height: h * .06,
                  // ),
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
                  // Text(
                  //   "_workArea".tr,
                  //   style: SignTitles,
                  // ),
                  // SizedBox(
                  //   height: h * .02,
                  // ),
                  //
                  // const Address(),
                  // Divider(
                  //   indent: w * .03,
                  //   endIndent: w * .03,
                  //   thickness: 1,
                  //   height: h * .04,
                  //   color:
                  //   Get.isDarkMode ? const Color(0xFF181818) : Colors.grey[700],
                  // ),
                  //
                  //
                  // Text(
                  //   "_graduationDate".tr,
                  //   style: SignTitles,
                  // ),
                  // SizedBox(
                  //   height: h * .02,
                  // ),
                  //
                  // const PickYear(),
                  Divider(
                    indent: w * .03,
                    endIndent: w * .03,
                    thickness: 1,
                    height: h * .04,
                    color: Get.isDarkMode
                        ? const Color(0xFF181818)
                        : Colors.grey[700],
                  ),

                  const HaveClinicen(),
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
                  //   "_workInHospital".tr,
                  //   style: SignTitles,
                  // ),
                  // const Hospital(),
                  // Divider(
                  //   indent: w * .03,
                  //   endIndent: w * .03,
                  //   thickness: 1,
                  //   height: h * .04,
                  //   color: Get.isDarkMode
                  //       ? const Color(0xFF181818)
                  //       : Colors.grey[700],
                  // ),
                ],
              ),
            ),
          ),
        ));
  }
}
