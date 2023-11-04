import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:graduation_project/Screens/UI_Nurse_Service/nursenaviationbar.dart';
import 'package:graduation_project/main.dart';
import 'package:path/path.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Model/Sign/UploadsModel.dart';
import 'package:graduation_project/Model/alart.dart';
import 'package:graduation_project/themes.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Model/Home/Address/Address.dart';
import '../../../Model/Home/Buttons.dart';
import '../../../Model/Home/SignradioBtn.dart';
import '../../../Model/Home/textFormField.dart';
import '../MedicalTeam_SignUp.dart';
import 'SignUpNurse.dart';

/*class NurseUploads extends StatefulWidget {
  const NurseUploads({Key? key}) : super(key: key);

  @override
  State<NurseUploads> createState() => _NurseUploadsState();
}

class _NurseUploadsState extends State<NurseUploads> {
  

  TextEditingController doctorInfo = TextEditingController();

  TextEditingController doctorEdu = TextEditingController();

  File? file;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "_arabicProfile".tr),
              Tab(text: "_englishProfile".tr)
            ],
          ),
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
                // print(nurseInfo.text);
                // print(nurseProfessionalAffiliation.text);
                // print(selectedItemsService);
                // print(professionalTitleValue);
                // print(anotherServices.text);
                // print(nurseEducationalQualification.text);
                // print(selectedItemslang);
                // print(selectedItemstimes);
                // print(selectedItemswork);
                // print(nurseInfoE.text);
                // print(nurseProfessionalAffiliationE.text);
                // print(anotherServicesE.text);
                // print(nurseEducationalQualificationE.text);
              },
            )
          ],
        ),
        body: const TabBarView(
          children: [
            NurseInfoArabic(),
            NurseEnglishInfo(),
            //   DoctorInfoArabic(),
            //   DoctorEnglishInfo(),
          ],
        ),
      ),
    );
  }
}*/

class NurseFiles extends StatefulWidget {
  const NurseFiles({Key? key}) : super(key: key);

  @override
  State<NurseFiles> createState() => _NurseFilesState();
}

signup_nurse_in_firebase(context) async {
  try {
    loading(context);
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: mailController.text, password: passController.text);
    return userCredential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      Get.back();
      AwesomeDialog(
              context: context,
              title: "Error",
              body: const Text("Password is to weak"))
          .show();
    } else if (e.code == 'email-already-in-use') {
      Get.back();
      AwesomeDialog(
              context: context,
              title: "Error",
              body: const Text("The account already exists for that email."))
          .show();
    }
  } catch (e) {
    Get.back();
    AwesomeDialog(
            context: context,
            title: "Error",
            body: const Text("Something went wrong, please try again later."))
        .show();
  }
}

put_nurse_date_into_firebase({
  required String uid,
  required String email,
  required String password,
  required String fname,
  required String lname,
  required String fullnamear,
  required String ssn,
  required String phone1,
  required DateTime birth,
  required int gender,
  required int government,
  required int city,
  required String nurse_info_ar,
  required String nurse_edu_ar,
  required String another_service_ar,
  required String nurse_info_en,
  required String nurse_edu_en,
  required String another_service_en,
  required String title,
  required String work_address,
  required List<String> services,
  required List<String> langs,
  required List<String> time,
  required List<String> work,
  required DateTime graduation,
  required File? profile,
  required File? license,
  double rate = 0.0,
}) async {
  String profile_url;
  String licence_url;
  if (profile != null && license != null) {
    var rand = Random().nextInt(100000);
    var rand1 = Random().nextInt(100000);
    var profname = "$rand" + basename(profile.path);
    var licename = "$rand1" + basename(license.path);

    // prepare upload photo and hold url
    var ref = FirebaseStorage.instance
        .ref("images")
        .child("nurse")
        .child('profiles')
        .child(profname);
    await ref.putFile(profile);

    var ref1 = FirebaseStorage.instance
        .ref("images")
        .child("nurse")
        .child('licensces')
        .child(licename);
    await ref1.putFile(license);
    profile_url = await ref.getDownloadURL();
    licence_url = await ref1.getDownloadURL();
  } else {
    profile_url =
        'https://firebasestorage.googleapis.com/v0/b/shefaa-71c42.appspot.com/o/calm.png?alt=media&token=92431814-1b9e-4a58-b3eb-78a3d3fa623a';
    licence_url =
        'https://firebasestorage.googleapis.com/v0/b/shefaa-71c42.appspot.com/o/calm.png?alt=media&token=92431814-1b9e-4a58-b3eb-78a3d3fa623a';
  }
  try {
    var add =
        await FirebaseFirestore.instance.collection("nurse").doc(uid).set({
      "userid": uid,
      "email": email,
      "password": password,
      "first_name": fname,
      "last_name": lname,
      "full_name_ar": fullnamear,
      "full_name_en": fname + " " + lname,
      "ssn": ssn,
      "phone1": phone1,
      "birthdate": birth,
      "gender": gender,
      "government": government,
      "city": city,
      "rate": rate,
      "bio_ar": nurse_info_ar,
      "bio_en": nurse_info_en,
      "title": title,
      "nurse_edu_ar": nurse_edu_ar,
      "nurse_edu_en": nurse_edu_en,
      "another_service_ar": another_service_ar,
      "another_service_en": another_service_en,
      "services": services,
      "langs": langs,
      "time": time,
      "work": work,
      "work_address": work_address,
      "graduation": graduation,
      "profile_url": profile_url,
      "licence_url": licence_url,
      "status": false,
    });

    box.write('login', true);
    box.write('type', 'nurse');
    Get.defaultDialog(
        title: "_requestSuccess".tr,
        content: Text(
          "_requestSaved".tr,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Get.isDarkMode ? Colors.white : Colors.black),
        ),

        // content: Text("You have raised a Alert Dialog Box"),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TxtButton(
                txt: "_exit".tr,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? white : darkGreyClr),
                function: () {
                  //////////////////////
                  Get.offAll(const nursehomepagenavigation());
                },
              ),
            ],
          ),
        ]);
  } catch (e) {
    Get.back();
    Get.snackbar(
      '_error'.tr,
      '_sthWrong'.tr,
      icon: const Icon(
        Icons.error,
        color: Color(0xFFB20600),
      ),
      backgroundColor: Colors.white,
      colorText: Colors.black,
      borderRadius: 10,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
    );
  }
}

class _NurseFilesState extends State<NurseFiles> {
  TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: PrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: h * .05, horizontal: w * .03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "_aboutToFinish".tr,
                style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xFFD57E7E),
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: h * .06,
              ),
              Text(
                "_uploadPhoto".tr,
                style: SignTitles,
              ),
              file == null
                  ? imgProfilepicker(context)
                  : cancelimage(h, w, context, true),
              Divider(
                indent: w * .07,
                endIndent: w * .07,
                thickness: 1,
                height: h * .06,
                color: Get.isDarkMode ? Colors.grey : Colors.grey[700],
              ),
              Text(
                "_professionLicense".tr,
                style: SignTitles,
              ),
              Container(
                  width: w,
                  alignment: Alignment.center,
                  child: lice == null
                      ? imglicepicker(h, w, context)
                      : cancelimage(h, w, context, false)),
              Divider(
                indent: w * .07,
                endIndent: w * .07,
                thickness: 1,
                height: h * .06,
                color: Get.isDarkMode ? Colors.grey : Colors.grey[700],
              ),
              Text(
                "_anyNotes".tr,
                style: SignTitles,
              ),
              SizedBox(
                height: h * .02,
              ),
              MultiLineTextField(
                controller: notesController,
              ),
              SizedBox(
                height: h * .06,
              ),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(DarkBlue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  child: SizedBox(
                    width: w * .4,
                    height: h * .07,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "_register".tr,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            fontSize: 16,
                            color: Get.isDarkMode ? white : white,
                          )),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Get.isDarkMode ? white : white,
                        )
                      ],
                    ),
                  ),
                  onPressed: () async {
                    if (file != null && lice != null) {
                      UserCredential response =
                          await signup_nurse_in_firebase(context);
                      if (response.user != null) {
                        put_nurse_date_into_firebase(
                            uid: response.user!.uid,
                            email: mailController.text,
                            password: passController.text,
                            fname: stNameController.text,
                            lname: lsNameController.text,
                            fullnamear: flNameController.text,
                            ssn: idController.text,
                            phone1: phoneNumber.toString(),
                            birth: birthdate!,
                            gender: groupValue!,
                            government: int.parse(governmentstore),
                            city: int.parse(citystore),
                            nurse_info_ar: nurseInfo.text,
                            nurse_edu_ar: nurseEducationalQualification.text,
                            another_service_ar: anotherServices.text,
                            nurse_info_en: nurseInfoE.text,
                            nurse_edu_en: nurseEducationalQualificationE.text,
                            another_service_en: anotherServicesE.text,
                            title: professionalTitleValue!,
                            work_address: AddressController.text,
                            services: selectedItemsService,
                            langs: selectedItemslang,
                            time: selectedItemstimes,
                            work: selectedItemswork,
                            graduation: selected!,
                            profile: file,
                            license: lice);
                      } else {
                        Get.back();
                        Get.snackbar(
                          '_error'.tr,
                          '_sthWrong'.tr,
                          icon: const Icon(
                            Icons.error,
                            color: Color(0xFFB20600),
                          ),
                          backgroundColor: Colors.white,
                          colorText: Colors.black,
                          borderRadius: 10,
                          snackPosition: SnackPosition.BOTTOM,
                          margin: const EdgeInsets.all(10),
                          duration: const Duration(seconds: 3),
                        );
                      }
                    } else {
                      Get.snackbar(
                        "_register".tr,
                        "_uploadPhotos".tr,
                        backgroundColor: const Color(0xFFB20600),
                        colorText: Colors.white,
                        borderRadius: 10,
                        snackPosition: SnackPosition.BOTTOM,
                        margin: const EdgeInsets.all(10),
                        duration: const Duration(seconds: 3),
                      );
                    }
                    // warning(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  File? file;
  File? lice;

  Stack cancelimage(
      double h, double w, BuildContext context, bool isFromProfile) {
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.only(top: h * .01),
            height: h * .25,
            width: w,
            child: Card(
                color: const Color(0xFFf6f8ff).withOpacity(.9),
                elevation: 4,
                clipBehavior: Clip.hardEdge,
                // margin: EdgeInsets.symmetric(vertical: h*.01,),
                child: isFromProfile ? Image.file(file!) : Image.file(lice!))),
        Positioned(
          right: -2,
          top: -2,
          child: IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () {
                isFromProfile
                    ? alterimage(context, true)
                    : alterimage(context, false);
              }),
        ),
      ],
    );
  }

  imglicepicker(
    double h,
    double w,
    BuildContext context,
  ) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: h * .01),
      height: h * .3,
      width: w * .8,
      child: Card(
        color: const Color(0xFFf6f8ff).withOpacity(.9),
        elevation: 4,
        clipBehavior: Clip.hardEdge,
        // margin: EdgeInsets.symmetric(vertical: h*.01,),
        child: Column(
          children: [
            SizedBox(height: h * .00000001),
            GestureDetector(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/Cloud Transfer Logo Template_prev_ui.png",
                    width: w * .6,
                    height: h * .2,
                  ),
                ],
              ),
              onTap: () {
                showModalBottomSheet(
                    elevation: 10,
                    backgroundColor: Colors.white12,
                    context: context,
                    builder: (ctx) => Container(
                          width: w * .06,
                          height: h * .2,
                          color: Colors.white54,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Buttons("_pickFromGallery".tr, 0xFF21325E,
                                  () async {
                                imagefromgallery(false);
                              },
                                  const Icon(
                                      Icons.photo_size_select_actual_outlined)),
                              SizedBox(height: h * .015),
                              Buttons("_pickFromCamera".tr, 0xFF21325E,
                                  () async {
                                imagefromcamera(false);
                              }, const Icon(Icons.camera_alt)),
                            ],
                          ),
                        ));
              },
            ),
            Container(
              child: Text("_professionLicense".tr),
              alignment: Alignment.center,
              // padding: EdgeInsets.only(bottom: h*.01 ),
            ),
          ],
        ),
      ),
    );
  }

  imgProfilepicker(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: h * .03),
      height: h * .25,
      // width: w * .34,
      child: Stack(children: <Widget>[
        const CircleAvatar(
            radius: 80.0,
            backgroundColor: Colors.white70,
            backgroundImage: AssetImage("assets/images/defaultPerson.jpg")),
        Positioned(
          bottom: 17.0,
          right: 10.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  elevation: 10,
                  // backgroundColor: DarkBlue,
                  context: context,
                  builder: (ctx) => Container(
                        width: w * .06,
                        height: h * .2,
                        color: const Color(0xFF1B262C),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Buttons("_pickFromGallery".tr, 0xFFE8E8E8,
                                () async {
                              imagefromgallery(true);
                            },
                                const Icon(
                                    Icons.photo_size_select_actual_outlined)),
                            SizedBox(height: h * .015),
                            Buttons("_pickFromCamera".tr, 0xFFE8E8E8, () async {
                              imagefromcamera(true);
                            }, const Icon(Icons.camera_alt)),
                          ],
                        ),
                      ));
            },
            child: const Icon(
              Icons.camera_alt,
              color: Color(0xFFC8C6C6),
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  imagefromgallery(bool isFromProfile) async {
    var picked = await ImagePicker().getImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        if (isFromProfile) {
          file = File(picked.path);
        } else {
          lice = File(picked.path);
        }
      });
    }
  }

  imagefromcamera(bool isFromProfile) async {
    var picked = await ImagePicker().getImage(source: ImageSource.camera);
    if (picked != null) {
      setState(() {
        if (isFromProfile) {
          file = File(picked.path);
        } else {
          lice = File(picked.path);
        }
      });
    }
  }

  alterimage(context, bool isFromProfile) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("_alterImage".tr),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                  setState(() {
                    isFromProfile ? file = null : lice = null;
                  });
                },
                child: Text("_yes".tr)),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("_no".tr))
          ],
        );
      },
    );
  }
}
