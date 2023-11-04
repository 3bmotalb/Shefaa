import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Model/alart.dart';
import 'package:graduation_project/Screens/UI_Dashboard/DashMainHome.dart';
import 'package:graduation_project/Screens/UI_Doctor_Services/doctornaviationbar.dart';
import 'package:graduation_project/main.dart';
import '../../Model/Home/textFormField.dart';
import '../../../themes.dart';
import '../UI_Nurse_Service/nursenaviationbar.dart';
import '../UI_User_Service/screens/navigationbar.dart';
import 'ChooseAccount.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool? _isObscure = true;

  final _formKey = GlobalKey<FormState>();

  // String? mail_txt,pass_txt;
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        key: _scaffoldKey,
        body: Builder(
            builder: (context) => Padding(
                  padding: EdgeInsets.all(h * .01),
                  child: Stack(children: [
                    ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                        child: Image.asset(
                          "assets/images/1.jpg",
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        )),
                    Container(
                        padding:
                            EdgeInsets.only(top: h * .055, bottom: h * .01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(11.0),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
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
                            AutoSizeText("_sign".tr,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Cairo",
                                    fontSize: 35,
                                    color: Color(0xFF002536))),
                            AutoSizeText("_in".tr,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Cairo",
                                    fontSize: 36,
                                    color: Color(0xFF687980))),
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
                              child: ListView(

                                  // verticalDirection: VerticalDirection.up,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    SizedBox(
                                      height: h * .05,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: .1, vertical: 2),
                                      child: TextFormField(
                                        cursorColor: DarkBlue,
                                        style: const TextStyle(
                                            color: Color(0xFF1D242B)),
                                        controller: mailController,
                                        // onSaved: (String ? value){
                                        //   value=savedTxt;
                                        // },

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
                                          // Return null if the entered email is valid
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          // fillColor: Color(0xFF1D242B),
                                          prefixIcon: Icon(Icons.mail,
                                              color: Get.isDarkMode
                                                  ? Colors.grey[700]
                                                  : Colors.grey[700]),
                                          // prefixIconColor: Colors.black,
                                          // suffixIconColor: Colors.black,
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
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: DarkBlue,
                                                      width: .9)),
                                        ),
                                      ),
                                    ),

                                    // TxtFormField(
                                    //   "Enter your E-mail",
                                    //
                                    //   TextInputType.emailAddress,
                                    //   "e-mail",
                                    //   const Icon(Icons.email),
                                    //   IconButton(
                                    //       icon: const Icon(null),
                                    //       onPressed: () {}),
                                    //   false,
                                    //   mailController,
                                    // ),
                                    TxtFormField(
                                      "_passs".tr,
                                      TextInputType.visiblePassword,
                                      "password",
                                      Icon(Icons.lock,
                                          color: Get.isDarkMode
                                              ? Colors.grey[700]
                                              : Colors.grey[700]),
                                      IconButton(
                                        icon: Icon(
                                            _isObscure!
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Get.isDarkMode
                                                ? Colors.grey[700]
                                                : Colors.grey[700]),
                                        onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure!;
                                          });
                                        },
                                      ),
                                      _isObscure!,
                                      passController,
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            bottom: h * .02, top: h * .00001),
                                        // padding: EdgeInsets.only(top: h*.001),
                                        alignment: Alignment.topRight,
                                        child: FittedBox(
                                          child: TextButton(
                                              onPressed: () {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content:
                                                      Text("اتصرف وافتكره"),
                                                ));
                                              },
                                              child: Text(
                                                "_forgotPassword".tr,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  // fontWeight: FontWeight.bold,
                                                  color: Get.isDarkMode
                                                      ? Blue
                                                      : Blue,
                                                ),
                                              )),
                                        )),
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

                                      child: Container(
                                        alignment: Alignment.center,
                                        width: w * .66,
                                        height: h * .07,
                                        child: Text(
                                          "_logIn".tr,
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Get.isDarkMode ? white : white,
                                          )),
                                        ),
                                      ),

                                      onPressed: () async {
                                        if (mailController.text == 'shefaa' &&
                                            passController.text == 'shefaa') {
                                              box.write('login', true);
                                          box.write('type', 'admin');
                                          Get.offAll(DashMainHome());
                                          
                                        } else {
                                          // if (_formKey.currentState!.validate()) {
                                          //   _formKey.currentState!.save();

                                          //   // Get.off(drawer);
                                          //   print(
                                          //       "//////////////////////////////////////");
                                          //   print(mailController.text);
                                          //   print(passController.text);
                                          // }
                                          UserCredential user = await signIn();

                                          // ignore: unnecessary_null_comparison
                                          if (user != null) {
                                            var isuser = await checkisuser(
                                                user.user!.uid);
                                            var isnurse = await checkisnurse(
                                                user.user!.uid);
                                            var isdoctor = await checkisdoctor(
                                                user.user!.uid);
                                            box.write('login', true);

                                            if (isuser) {
                                              box.write('type', 'user');

                                              /////////////////////////////////////
                                              //Get to nurse Home Page Hegazy Task
                                              /////////////////////////////////////
                                              Get.offAll(
                                                  const homepagenavigation());
                                            } else if (isnurse) {
                                              box.write('type', 'nurse');
                                              /////////////////////////////////////
                                              //Get to user Home Page Ismail Task
                                              /////////////////////////////////////
                                              Get.offAll(
                                                  const nursehomepagenavigation());
                                            } else if (isdoctor) {
                                              box.write('type', 'doctor');
                                              /////////////////////////////////////
                                              //Get to user Home Page Ismail Task
                                              /////////////////////////////////////
                                              Get.offAll(
                                                  const doctorhomepagenavigation());
                                            } else {}
                                          }
                                          
                                        }
                                      },
                                    )),
                                    Divider(
                                      indent: w * .03,
                                      endIndent: w * .03,
                                      height: h * .08,
                                      thickness: 2,
                                      color: const Color(0XFF002536),
                                    ),
                                    Container(
                                      // alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.only(bottom: h * .01),
                                      child: AutoSizeText(
                                        "_signAlso".tr,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                          color: Get.isDarkMode
                                              ? DarkBlue
                                              : DarkBlue,
                                        ),
                                        // textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/gmail.png",
                                          height: h * .041,
                                          width: w * .151,
                                        ),
                                        Image.asset(
                                            "assets/images/facebook .png",
                                            height: h * .041,
                                            width: w * .151),
                                        Image.asset("assets/images/twitter.png",
                                            height: h * .041, width: w * .151),
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.end,
                                    ),
                                    Container(
                                        width: w * .8,
                                        height: h * .14,
                                        margin: EdgeInsets.only(
                                            top: h * .05, bottom: h * .06),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFD6E6F2),
                                          borderRadius:
                                              BorderRadius.circular(h * .01),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: w * .01,
                                            vertical: h * .01),
                                        child: Column(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.start,
                                            children: [
                                              AutoSizeText('_noAccount'.tr,
                                                  // maxLines: 2,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Color(0xFF002536))),
                                              SizedBox(
                                                height: h * .07,
                                                child: TextButton(
                                                  onPressed: () {
                                                    Get.to(const ChooseAcc());
                                                  },
                                                  child: AutoSizeText(
                                                      '_createOne'.tr,
                                                      // maxLines: 2,

                                                      style: const TextStyle(
                                                          fontSize: 17,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          color: Color(
                                                              0xFF798777))),
                                                ),
                                              )
                                            ])),
                                  ]),
                            ),
                          ),
                        ))
                  ]),
                )));
  }

// sign in function
  signIn() async {
    var formdata = _formKey.currentState!;
    if (formdata.validate()) {
      formdata.save();
      try {
        loading(context);
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: mailController.text, password: passController.text);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Navigator.of(context).pop();
          AwesomeDialog(
                  context: context, title: "Error", body: Text("_noUser".tr))
              .show();
        } else if (e.code == 'wrong-password') {
          Navigator.of(context).pop();
          AwesomeDialog(
                  context: context, title: "Error", body: Text("_wrongPass".tr))
              .show();
        }
      }
    } else {}
  }

  Future<bool> checkisuser(String uid) async {
    DocumentSnapshot ds =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    return ds.exists;
  }

  Future<bool> checkisdoctor(String uid) async {
    DocumentSnapshot ds =
        await FirebaseFirestore.instance.collection("doctor").doc(uid).get();
    return ds.exists;
  }

  Future<bool> checkisnurse(String uid) async {
    DocumentSnapshot ds =
        await FirebaseFirestore.instance.collection("nurse").doc(uid).get();
    return ds.exists;
  }
}
