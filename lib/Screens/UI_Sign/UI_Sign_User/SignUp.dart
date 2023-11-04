// ignore_for_file: prefer_final_fields, unused_field, deprecated_member_use

import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Model/Home/PhoneNumbers.dart';
import 'package:graduation_project/Model/alart.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/navigationbar.dart';
import 'package:graduation_project/main.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Controlers/C_Sign/PassValidation.dart';
import '../../../Model/Home/Address/Address.dart';
import '../../../Model/Home/Buttons.dart';
import '../../../Model/Home/DateField.dart';
import '../../../Model/Home/SignradioBtn.dart';
import '../../../Model/Home/textFormField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../themes.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Reference? ref;

  bool _isObscure = true, _isObscure0 = true;

  int _radioVal = 0;
  int gender = 3;

  final _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PhoneNumber? phonenumber1, phonenumber2;

  TextEditingController stNameController = TextEditingController();
  TextEditingController lsNameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController repassController = TextEditingController();
  TextEditingController Phone1Controller = TextEditingController();
  TextEditingController Phone2Controller = TextEditingController();
  DateTime? birthdate;

  File? file;

  ///validation
  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

// return user credintal store all date about user (uid-email-password)
//use uid to create doc for this user by his id and store his data in another function
  signup_user_in_firebase(context) async {
    var formdata = _formKey.currentState!;
    if (formdata.validate()) {
      formdata.save();
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
                  body:
                      const Text("The account already exists for that email."))
              .show();
        }
      } catch (e) {
        // print(e);
      }
    } else {
      // print("not valid");
    }
  }

  put_user_date_into_firebase({
    required String uid,
    required String email,
    required String password,
    required String fname,
    required String lname,
    required String ssn,
    required String phone1,
    required String phone2,
    required String birth,
    required int gender,
    required int government,
    required int city,
    required File? image,
  }) async {
    String imageurl;
    if (image != null) {
      var rand = Random().nextInt(100000);
      var imagename = "$rand" + basename(image.path);

      // prepare upload photo and hold url
      ref = FirebaseStorage.instance
          .ref("images")
          .child("users")
          .child(imagename);
      //upload
      await ref!.putFile(file!);
      //hold url
      imageurl = await ref!.getDownloadURL();
    } else {
      imageurl =
          'https://firebasestorage.googleapis.com/v0/b/shefaa-71c42.appspot.com/o/calm.png?alt=media&token=92431814-1b9e-4a58-b3eb-78a3d3fa623a';
    }
    try {
      await FirebaseFirestore.instance.collection("users").doc(uid).set({
        "userid": uid,
        "email": email,
        "password": password,
        "first_name": fname,
        "last_name": lname,
        "ssn": ssn,
        "phone1": phone1,
        "phone2": phone2,
        "birthdate": birth,
        "gender": gender,
        "government": government,
        "city": city,
        "imageurl": imageurl
      });
      box.write('login', true);
      box.write('type', 'user');

              Get.offAll(const homepagenavigation());
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: context.theme.backgroundColor,
        key: _scaffoldKey,
        body: Builder(
            builder: (context) => Stack(children: [
                  ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                      child: Image.asset(
                        "assets/images/1.jpg",
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
                                  color: Color(0xFF002536),
                                  shape: BoxShape.circle),
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
                            color: const Color(0xFFF5F5F5).withOpacity(.96),
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
                                    file == null
                                        ? imgProfilepicker(context)
                                        : cancelimage(h, w, context),
                                    TxtFormField(
                                      "_firstName".tr,
                                      TextInputType.text,
                                      "First name",
                                      Icon(Icons.person,
                                          color: Get.isDarkMode
                                              ? Colors.grey[700]
                                              : Colors.grey[700]),
                                      IconButton(
                                          icon: const Icon(null),
                                          onPressed: () {}),
                                      false,
                                      stNameController,
                                    ),
                                    TxtFormField(
                                      "_lastName".tr,
                                      TextInputType.text,
                                      "Last name",
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
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: .1, vertical: 2),
                                      child: TextFormField(
                                        cursorColor: DarkBlue,
                                        style: const TextStyle(
                                            color: Color(0xFF1D242B)),
                                        controller: mailController,
                                        obscureText: false,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return ("_emptyField".tr);
                                          }
                                          if (!RegExp(r'\S+@\S+\.\S+')
                                              .hasMatch(value)) {
                                            return '_validEmail'.tr;
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.mail,
                                              color: Get.isDarkMode
                                                  ? Colors.grey[700]
                                                  : Colors.grey[700]),
                                          hintText: "_email".tr,
                                          hintStyle: TextStyle(
                                              color: Get.isDarkMode
                                                  ? Colors.grey[700]
                                                  : Colors.grey[700]),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              width: 1.9,
                                              color: Color(0xFF324E7B),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(w * .06),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: DarkBlue,
                                                      width: .9)),
                                        ),
                                      ),
                                    ),
                                    TxtFormField(
                                      "_id".tr,
                                      TextInputType.number,
                                      "SSN",
                                      const Icon(Icons.card_membership),
                                      IconButton(
                                          icon: const Icon(null),
                                          onPressed: () {}),
                                      false,
                                      idController,
                                      maxLines: 14,
                                    ),
                                    PassValidation(
                                        controller: passController,
                                        controller0: repassController),
                                    SizedBox(
                                      height: h * .03,
                                    ),
                                    Text(
                                      "_phone".tr,
                                      style: SignTitles,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: h * .012, bottom: h * .03),
                                      child: phonenumber(
                                          onsaved: (PhoneNumber number) {
                                        phonenumber1 = number;
                                      }),
                                    ),
                                    SizedBox(
                                      height: h * .03,
                                    ),
                                    Text(
                                      "_ePhone".tr,
                                      style: SignTitles,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: h * .012, bottom: h * .03),
                                      child: phonenumber(
                                          onsaved: (PhoneNumber number) {
                                        phonenumber2 = number;
                                      }),
                                    ),
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
                                    SizedBox(
                                      height: h * .03,
                                    ),
                                    Text(
                                      '_selectYourCountry'.tr,
                                      style: SignTitles,
                                    ),
                                    const Address(),
                                    SizedBox(
                                      height: h * .06,
                                    ),
                                    Center(
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(DarkBlue),
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
                                                "_register".tr,
                                                style: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: Get.isDarkMode
                                                      ? white
                                                      : white,
                                                )),
                                              ),
                                              Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                color: Get.isDarkMode
                                                    ? white
                                                    : white,
                                              )
                                            ],
                                          ),
                                        ),

                                        onPressed: () async {
                                          ////////////////////PassValidator////////////////////
                                          // checkPassword(_password);
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _formKey.currentState!.save();
                                            String birth = DateFormat.yMd()
                                                .format(birthdate!);

                                            await PassValidationState.passFun(
                                                passController.text,
                                                repassController.text);

                                            /////////////////////////////////////////////////////////////////////////////////////////

                                            UserCredential response =
                                                await signup_user_in_firebase(
                                                    context);
                                            // ignore: unnecessary_null_comparison
                                            if (response != null) {
                                              //if user signed up
                                              //call function to add his data
                                              put_user_date_into_firebase(
                                                uid: response.user!.uid,
                                                fname: stNameController.text,
                                                lname: lsNameController.text,
                                                email: mailController.text,
                                                password: passController.text,
                                                ssn: idController.text,
                                                gender: groupValue!,
                                                phone1: phonenumber1.toString(),
                                                phone2: phonenumber2.toString(),
                                                birth: birth,
                                                city: int.parse(citystore),
                                                government:
                                                    int.parse(governmentstore),
                                                image: file,
                                              );
                                              print(
                                                  put_user_date_into_firebase);
                                              governorateName = "";
                                              cityName = "";
                                              groupValue = 0;
                                              //Get user to user Home Page //ismail task

                                              // Get.to();
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text('Error')),
                                            );
                                            print("Sign Up Failed");
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: h * .2,
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      )),
                ])));
  }

  Stack cancelimage(double h, double w, BuildContext context) {
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
              child: Image.file(file!),
            )),
        Positioned(
          right: -2,
          top: -2,
          child: IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () {
                alterimage(context);
              }),
        ),
      ],
    );
  }

  //////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////
  ///////////////Image Picker //////////////////////////////////////////////

  // imgpicker(BuildContext context, String txt) {
  //   double h = MediaQuery.of(context).size.height;
  //   double w = MediaQuery.of(context).size.width;
  //
  //   return Container(
  //     padding: EdgeInsets.only(top: h * .01),
  //     height: h * .25,
  //     width: w * .3,
  //     child: Card(
  //       color: const Color(0xFFf6f8ff).withOpacity(.9),
  //       elevation: 4,
  //       clipBehavior: Clip.hardEdge,
  //       // margin: EdgeInsets.symmetric(vertical: h*.01,),
  //       child: Column(
  //         children: [
  //           SizedBox(height: h * .00000001),
  //           GestureDetector(
  //             child: Column(
  //               children: [
  //                 Image.asset(
  //                   "assets/images/Cloud Transfer Logo Template_prev_ui.png",
  //                   width: w * .6,
  //                   height: h * .2,
  //                 ),
  //               ],
  //             ),
  //             onTap: () {
  //               showModalBottomSheet(
  //                   elevation: 10,
  //                   // backgroundColor: Colors.white12,
  //                   context: context,
  //                   builder: (ctx) => Container(
  //                         width: w * .06,
  //                         height: h * .2,
  //                     color: const Color(0xFF1B262C),
  //                         alignment: Alignment.center,
  //                         child: Column(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: [
  //                             Buttons("Pick from gallery", 0xFFE8E8E8,
  //                                 () async {
  //                               imagefromgallery();
  //                             },
  //                                 const Icon(
  //                                     Icons.photo_size_select_actual_outlined)),
  //                             SizedBox(height: h * .015),
  //                             Buttons("Pick from camera", 0xFFE8E8E8, () async {
  //                               imagefromcamera();
  //                             }, const Icon(Icons.camera_alt)),
  //                           ],
  //                         ),
  //                       ));
  //             },
  //           ),
  //           Container(
  //             child: Text(txt),
  //             alignment: Alignment.center,
  //             // padding: EdgeInsets.only(bottom: h*.01 ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

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
            backgroundImage: AssetImage("assets/image2.png")),
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
                              imagefromgallery();
                            },
                                const Icon(
                                    Icons.photo_size_select_actual_outlined)),
                            SizedBox(height: h * .015),
                            Buttons("_pickFromCamera".tr, 0xFFE8E8E8, () async {
                              imagefromcamera();
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

      // Card(
      //   color: const Color(0xFFf6f8ff).withOpacity(.9),
      //   elevation: 4,
      //   clipBehavior: Clip.hardEdge,
      //   // margin: EdgeInsets.symmetric(vertical: h*.01,),
      //   child: Column(
      //     children: [
      //       SizedBox(height: h * .00000001),
      //       GestureDetector(
      //         child: Column(
      //           children: [
      //             Image.asset(
      //               "assets/images/Cloud Transfer Logo Template_prev_ui.png",
      //               width: w * .6,
      //               height: h * .2,
      //             ),
      //           ],
      //         ),
      //         onTap: () {
      //           showModalBottomSheet(
      //               elevation: 10,
      //               backgroundColor: Colors.white12,
      //               context: context,
      //               builder: (ctx) => Container(
      //                     width: w * .06,
      //                     height: h * .2,
      //                     color: Colors.white54,
      //                     alignment: Alignment.center,
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       children: [
      //                         Buttons("Pick from gallery", 0xFF21325E,
      //                             () async {
      //                           imagefromgallery();
      //                         },
      //                             const Icon(
      //                                 Icons.photo_size_select_actual_outlined)),
      //                         SizedBox(height: h * .015),
      //                         Buttons("Pick from camera", 0xFF21325E, () async {
      //                           imagefromcamera();
      //                         }, const Icon(Icons.camera_alt)),
      //                       ],
      //                     ),
      //                   ));
      //         },
      //       ),
      //       Container(
      //         child: Text(txt),
      //         alignment: Alignment.center,
      //         // padding: EdgeInsets.only(bottom: h*.01 ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  imagefromgallery() async {
    var picked = await ImagePicker().getImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        file = File(picked.path);
      });
    }
  }

  imagefromcamera() async {
    var picked = await ImagePicker().getImage(source: ImageSource.camera);
    if (picked != null) {
      file = File(picked.path);
    }
  }

  alterimage(context) {
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
                    file = null;
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

////////////////////................Email Validation.............../////////////////////////////
//   String? _confirmPassword;
//   String _password = '';
//   double _strength = 0;
//   String _displayText = ' ';
//
//   RegExp numReg = RegExp(r".*[0-9].*");
//   RegExp letterReg = RegExp(r".*[A-Za-z].*");
//
//   void checkPassword(String value) {
//     _password = value.trim();
//
//     if (_password.isEmpty) {
//       setState(() {
//         _strength = 0;
//         _displayText = 'Please enter you password';
//       });
//     } else if (_password.length < 6) {
//       setState(() {
//         _strength = 1 / 4;
//         _displayText = 'Your password is too short';
//       });
//     } else if (_password.length < 8) {
//       setState(() {
//         _strength = 2 / 4;
//         _displayText = 'Your password is acceptable but not strong';
//       });
//     } else {
//       if (!letterReg.hasMatch(_password) || !numReg.hasMatch(_password)) {
//         setState(() {
//           // Password length >= 8
//           // But doesn't contain both letter and digit characters
//           _strength = 3 / 4;
//           // _displayText = 'Your password is strong';
//         });
//       } else {
//         // Password length >= 8
//         // Password contains both letter and digit characters
//         setState(() {
//           _strength = 1;
//           _displayText = 'Your password is great';
//         });
//       }
//     }
//   }
//
//   Widget PassFormField(
//       {TextEditingController? controller, TextEditingController? controller0}) {
//     // TextEditingController? controller;
//     // TextEditingController? controller0;
//     // 0: No password
//     // 1/4: Weak
//     // 2/4: Medium
//     // 3/4: Strong
//     // 1: Great
//     //
//     // RegExp numReg = RegExp(r".*[0-9].*");
//     // RegExp letterReg = RegExp(r".*[A-Za-z].*");
//     //
//     // void checkPassword(String value) {
//     //   _password = value.trim();
//     //
//     //   if (_password.isEmpty) {
//     //     setState(() {
//     //       _strength = 0;
//     //       _displayText = 'Please enter you password';
//     //     });
//     //   } else if (_password.length < 6) {
//     //     setState(() {
//     //       _strength = 1 / 4;
//     //       _displayText = 'Your password is too short';
//     //     });
//     //   } else if (_password.length < 8) {
//     //     setState(() {
//     //       _strength = 2 / 4;
//     //       // _displayText = 'Your password is acceptable but not strong';
//     //     });
//     //   } else {
//     //     if (!letterReg.hasMatch(_password) || !numReg.hasMatch(_password)) {
//     //       setState(() {
//     //         // Password length >= 8
//     //         // But doesn't contain both letter and digit characters
//     //         _strength = 3 / 4;
//     //         // _displayText = 'Your password is strong';
//     //       });
//     //     } else {
//     //       // Password length >= 8
//     //       // Password contains both letter and digit characters
//     //       setState(() {
//     //         _strength = 1;
//     //         _displayText = 'Your password is great';
//     //       });
//     //     }
//     //   }
//     // }
//
//     final _formKey = GlobalKey<FormState>();
//
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               labelText: 'Password',
//               suffixIcon: IconButton(
//                 icon:
//                     Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
//                 onPressed: () {
//                   setState(() {
//                     _isObscure = !_isObscure;
//                   });
//                 },
//               ),
//             ),
//             obscureText: _isObscure,
//             validator: (value) {
//               if (value == null || value.trim().isEmpty) {
//                 return 'This field is required';
//               }
//               if (value.trim().length < 8) {
//                 return 'Password must be at least 8 characters in length';
//               }
//               // Return null if the entered password is valid
//               return null;
//             },
//             onChanged: (value) {
//               // value=_password;
//
//               checkPassword(value);
//               _password = value;
//             },
//           ),
//
//           // TextField(
//           //   onChanged: (value) => _checkPassword(value),
//           //   obscureText: true,
//           //   decoration: const InputDecoration(
//           //       border: OutlineInputBorder(), hintText: 'Password'),
//           // ),
//           const SizedBox(
//             height: 10,
//           ),
//           // The strength indicator bar
//           LinearProgressIndicator(
//             value: _strength,
//             backgroundColor: Colors.grey[300],
//             color: _strength <= 1 / 4
//                 ? Colors.red
//                 : _strength == 2 / 4
//                     ? Colors.yellow
//                     : _strength == 3 / 4
//                         ? Colors.blue
//                         : Colors.green,
//             minHeight: 15,
//           ),
//           // const SizedBox(
//           //   height: 20,
//           // ),
//
//           // The message about the strength of the entered password
//           Text(
//             _displayText,
//             style: const TextStyle(fontSize: 18),
//           ),
//           const SizedBox(
//             height: 50,
//           ),
//
//           /// Confirm Password
//           TextFormField(
//             controller: controller0,
//             decoration: InputDecoration(
//               labelText: 'Confirm Password',
//               suffixIcon: IconButton(
//                 icon:
//                     Icon(_isObscure0 ? Icons.visibility_off : Icons.visibility),
//                 onPressed: () {
//                   setState(() {
//                     _isObscure0 = !_isObscure0;
//                   });
//                 },
//               ),
//             ),
//             obscureText: _isObscure0,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'This field is required';
//               }
//               if (value.trim().length < 8) {
//                 return 'Password must be at least 8 characters in length';
//               }
//
//               // if (value != (_password)) {
//               //    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               //     content: Text('Confimation password does not match the entered password'),
//               //   ));
//               // }
//
//               return null;
//             },
//             onChanged: (value) => _confirmPassword = value,
//           ),
//
//           // This button will be enabled if the password strength is medium or beyond
//           // ElevatedButton(
//           //     onPressed: (){
//           //       if(_strength >= (2/ 4) &&(_confirmPassword==_password)
//           //       // &&(_confirmPassword!.length < 8)&&(_password!.length < 8)
//           //       ){
//           //         _displayText='Confirmation password does not match the entered password';
//           //         Get.to(const SignIn());
//           //
//           //       }
//           //       else{
//           //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           //           content: Text(_displayText),
//           //         ));
//           //       }
//           //     },
//           //     //
//           //     // _strength < 1 / 2 ? null : () {
//           //     //
//           //     //   Get.to(SignIn());
//           //     // },
//           //     child: const Text('Continue'))
//         ],
//       ),
//     );
//     // void _trySubmitForm() {
//     //   final bool? isValid = _formKey.currentState?.validate();
//     //   if (isValid == true) {
//     //     debugPrint('Everything looks good!');
//     //     debugPrint(_password);
//     //     debugPrint(_confirmPassword);
//     //
//     //     /*
//     //   Continute proccessing the provided information with your own logic
//     //   such us sending HTTP requests, savaing to SQLite database, etc.
//     //   */
//     //   }
//     // }
//   }
}
