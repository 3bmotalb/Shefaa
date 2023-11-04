// ignore_for_file: prefer_typing_uninitialized_variables, unused_element, unused_local_variable

import 'dart:io';
import 'dart:ui';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Controlers/C_Sign/PassValidation.dart';
import 'package:graduation_project/Model/Home/PhoneNumbers.dart';
import 'package:graduation_project/Model/Home/SignradioBtn.dart';
import 'package:graduation_project/Screens/UI_Sign/UI_Sign_Doctor/SignUpDoctor.dart';
import 'package:graduation_project/Screens/UI_Sign/UI_Sign_Nurse/SignUpNurse.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:path/path.dart';
import '../../Model/Home/DateField.dart';
import '../../Model/Home/textFormField.dart';
import '../../themes.dart';

class MedicalTeamSignUp extends StatefulWidget {
  const MedicalTeamSignUp({Key? key}) : super(key: key);
  @override
  State<MedicalTeamSignUp> createState() => _MedicalTeamSignUpState();
}

late PhoneNumber phoneNumber;
TextEditingController stNameController = TextEditingController();
TextEditingController lsNameController = TextEditingController();
TextEditingController flNameController = TextEditingController();
TextEditingController mailController = TextEditingController();
TextEditingController idController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController repassController = TextEditingController();
TextEditingController PhoneController = TextEditingController();

File? file;
var filename;
DateTime? birthdate;
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
final _formKey = GlobalKey<FormState>();

class _MedicalTeamSignUpState extends State<MedicalTeamSignUp> {
  //////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    int _radioVal = 0;

    PhoneNumber? number;

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        key: _scaffoldKey,
        body: Builder(
          builder: (context) => Stack(children: [
            ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Image.asset(
                  "assets/images/3.jpg",
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill,
                )),
            Container(
                padding: EdgeInsets.only(top: h * .055, bottom: h * .01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(11.0),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: const BoxDecoration(
                            color: Color(0xFF002536), shape: BoxShape.circle),
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Get.isDarkMode ? white : white,
                        ),
                      ),
                      // backgroundColor: const Color(0xFF002536),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(left: w * .023),
                    //   child: AutoSizeText("_signUp".tr,
                    //       style: const TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           fontFamily: "Cairo",
                    //           fontSize: 38,
                    //           color: Color(0xFF002536))),
                    // )
                  ],
                )),
            Positioned(
                top: h * .2,
                left: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.only(top: h * .01),
                  padding: EdgeInsets.symmetric(horizontal: w * .02),
                  decoration: BoxDecoration(
                      color: const Color(0xFFF1F3F4).withOpacity(.96),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(w * .13),
                          topRight: Radius.circular(w * .13))),
                  alignment: Alignment.bottomCenter,
                  child: Form(
                    key: _formKey,
                    child: SizedBox(
                      height: h * .8,
                      width: w * .9,
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            children: [
                              SizedBox(
                                height: h * .05,
                              ),
                              TxtFormField(
                                "_firstName".tr,
                                TextInputType.text,
                                "_firstNameLbl",
                                Icon(Icons.person,
                                    color: Get.isDarkMode
                                        ? Colors.grey[700]
                                        : Colors.grey[700]),
                                IconButton(
                                    icon: const Icon(null), onPressed: () {}),
                                false,
                                stNameController,
                              ),
                              TxtFormField(
                                "_lastName".tr,
                                TextInputType.text,
                                "_lastNameLbl",
                                Icon(Icons.person,
                                    color: Get.isDarkMode
                                        ? Colors.grey[700]
                                        : Colors.grey[700]),
                                IconButton(
                                  icon: const Icon(null),
                                  onPressed: () {},
                                ),
                                false,
                                lsNameController,
                              ),
                              TxtFormField(
                                "_fullName".tr,
                                TextInputType.text,
                                "_fullNameLbl",
                                Icon(Icons.person,
                                    color: Get.isDarkMode
                                        ? Colors.grey[700]
                                        : Colors.grey[700]),
                                IconButton(
                                  icon: const Icon(null),
                                  onPressed: () {},
                                ),
                                false,
                                ////////////////////
                                ////////////////////
                                ////////////////////
                                ////////////////////
                                ////////////////////
                                flNameController,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: .1, vertical: 2),
                                child: TextFormField(
                                  cursorColor: DarkBlue,
                                  style:
                                      const TextStyle(color: Color(0xFF1D242B)),

                                  controller: mailController,
                                  // onSaved: (String ? value){
                                  //   value=savedTxt;
                                  // },

                                  obscureText: false,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return ("_emptyField".tr);
                                    }
                                    if (!RegExp(r'\S+@\S+\.\S+')
                                        .hasMatch(value)) {
                                      return '_validEmail'.tr;
                                    }
                                    // Return null if the entered email is valid
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.mail,
                                      color: Get.isDarkMode
                                          ? Colors.grey[700]
                                          : Colors.grey[700],
                                    ),
                                    // prefixIconColor:Get.isDarkMode ? Colors.grey[700] :Colors.grey[700],
                                    // suffixIconColor:Get.isDarkMode ? Colors.grey[700] :Colors.grey[700],
                                    hintText: "_email".tr,
                                    hintStyle: TextStyle(
                                        color: Get.isDarkMode
                                            ? Colors.grey[700]
                                            : Colors.grey[700]),

                                    // iconColor: Colors.yellow,
                                    // label: Text(lblText),

                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 1.9,
                                        color: Color(0xFF324E7B),
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(w * .06),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: DarkBlue, width: .9)),
                                  ),
                                ),
                              ),

                              TxtFormField(
                                "_id".tr,
                                TextInputType.number,
                                "_idLbl",
                                Icon(Icons.card_membership,
                                    color: Get.isDarkMode
                                        ? Colors.grey[700]
                                        : Colors.grey[700]),
                                IconButton(
                                    icon: const Icon(null), onPressed: () {}),
                                false,
                                idController,
                                maxLines: 14,
                              ),
                              PassValidation(
                                  controller: passController,
                                  controller0: repassController),
                              SizedBox(
                                height: h * .04,
                              ),
                              Text(
                                "_phone".tr,
                                style: SignTitles,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: h * .012, bottom: h * .03),
                                child:
                                    phonenumber(onsaved: (PhoneNumber number) {
                                  phoneNumber = number;
                                }),
                              ),
                              // TxtFormField(
                              //   "Enter your PhoneNumber",
                              //   TextInputType.number,
                              //   "Phone 1",
                              //   const Icon(null),
                              //   IconButton(
                              //       icon: const Icon(null),
                              //       onPressed: () {}),
                              //   false,
                              //   PhoneController,
                              // ),
                              SizedBox(
                                height: h * .01,
                              ),

                              Text(
                                "_birthdate".tr,
                                style: SignTitles,
                              ),
                              Card(
                                color: Get.isDarkMode
                                    ? const Color(0xFFFAF9F9)
                                    : const Color(0xFFFAF9F9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      w * .04), // if you need this
                                  side: const BorderSide(
                                    // color: Colors.grey.withOpacity(0.2),
                                    width: 1,
                                  ),
                                ),
                                child: Datepicker(
                                  onsaved: (time) {
                                    birthdate = time;
                                  },
                                ),
                              ),

                              SizedBox(
                                height: h * .03,
                              ),
                              Text("_gender".tr, style: SignTitles),

                              const SignRadioBtn(),

                              // SizedBox(
                              //   height: h * .03,
                              // ),
                              // Text(
                              //   '_selectYourCountry'.tr,
                              //   style: SignTitles,
                              // ),
                              // const Address(),
                              SizedBox(
                                height: h * .04,
                              ),

                              Center(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              DarkBlue),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        // side: BorderSide(color: Colors.red),
                                      ))),

                                  // backgroundColor: DarkBlue,

                                  child: SizedBox(
                                    width: w * .4,
                                    height: h * .07,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "_continue".tr,
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Get.isDarkMode ? white : white,
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
                                    if (_formKey.currentState!.validate() &&
                                        groupValue != null &&
                                        birthdate != null) {
                                      if (idController.text.length != 14) {
                                        Get.snackbar(
                                          "Error",
                                          "_idError".tr,
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white,
                                          margin: const EdgeInsets.all(10),
                                          snackStyle: SnackStyle.FLOATING,
                                          duration: const Duration(seconds: 2),
                                        );
                                        return;
                                      }
                                      _formKey.currentState!.save();
                                      chosse(context);
                                    } else {
                                      Get.snackbar(
                                          'error', 'please complete all data',
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Colors.white,
                                          colorText: Colors.red,
                                          icon: const Icon(
                                            Icons.warning_amber,
                                            color: Colors.red,
                                          ));
                                    }

                                    // if (_formKey.currentState!.validate()) {
                                    //   _formKey.currentState!.save();
                                    //   await PassValidationState.passFun(
                                    //       passController.text,
                                    //       repassController.text);
                                    //   // print(stNameController.text);
                                    //   // print(lsNameController.text);
                                    //   // print(mailController.text);
                                    //   // print(passController.text);
                                    //   // print(idController.text);
                                    //   // print(birthdate);
                                    //   // print(phoneNumber);
                                    //   // print(groupValue);
                                    //   // print(citystore);
                                    //   // print(governmentstore);

                                    //   // UserCredential? response =
                                    //   //     await signup_user_in_firebase(
                                    //   //         context);
                                    //   // if (response != null) {
                                    //   //   put_user_date_into_firebase(
                                    //   //     uid: response.user!.uid,
                                    //   //     fname: stNameController.text,
                                    //   //     lname: lsNameController.text,
                                    //   //     email: mailController.text,
                                    //   //     password: passController.text,
                                    //   //     ssn: idController.text,
                                    //   //     gender: gender,
                                    //   //     phone1: PhoneController.text,
                                    //   //     birth: birth,
                                    //   //     city: 1,
                                    //   //     government: 2,
                                    //   //   );
                                    //   // } else {
                                    //   //   Get.back();
                                    //   //   print("Sign Up Failed");
                                    //   // }
                                    // } else {
                                    //   print("failed");
                                    // }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: h * .09,
                              ),
                            ]),
                      ),
                    ),
                  ),
                ))
          ]),
        ));
  }

  chosse(BuildContext context) {
    showDialog(

      context: context,
      builder: (ctx) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(
                Radius.circular(10.0))),
        title: Text("_registerAs".tr,style: SignTitles,),
        // content: Text("You have raised a Alert Dialog Box"),
        content:
          Builder(
            builder: (context) {
              var h = MediaQuery.of(context).size.height;
              var w = MediaQuery.of(context).size.width;

              return SizedBox(
                height: h*.15,
                width: w*.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.to(const NurseInfoArabic());
                      },
                      child: AutoSizeText("_nurse".tr),
                      style:   ElevatedButton.styleFrom(
                        primary: const Color(0xFF29435c).withOpacity(.8),
                        // onPrimary: Colors.white,
                        // shadowColor: Colors.greenAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        minimumSize:  Size(w*.3, h*.05),)
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   PageTransition(
                        //     type: PageTransitionType
                        //         .rightToLeft,
                        //     child:
                        //         const DoctorUploads(),
                        //   ),
                        // );
                        Get.to(const DoctorInfoArabic());
                      },
                      child: AutoSizeText("_doctor".tr),
                      style:
              ElevatedButton.styleFrom(
              primary: const Color(0xFF29435c).withOpacity(.8),
              // onPrimary: Colors.white,
              // shadowColor: Colors.greenAccent,
              elevation: 3,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)),
              minimumSize:  Size(w*.3, h*.05),

                      // ButtonStyle(
                      //   backgroundColor: MaterialStateColor.resolveWith(
                      //           (states) =>
                      //           const Color(0xFF29435c).withOpacity(.8)),
                      //
                      ),
                    ),
                  ],
                ),
              );

            }),

      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() {
      file = File(path);
      filename = basename(file!.path);
    });
  }
}
