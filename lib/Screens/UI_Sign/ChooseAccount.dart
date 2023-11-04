import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/themes.dart';
import 'package:page_transition/page_transition.dart';

import 'package:flutter/material.dart';

import 'MedicalTeam_SignUp.dart';
import 'UI_Sign_User/SignUp.dart';

class ChooseAcc extends StatefulWidget {
  const ChooseAcc({Key? key}) : super(key: key);

  @override
  State<ChooseAcc> createState() => _ChooseAccState();
}

class _ChooseAccState extends State<ChooseAcc> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,

      body: Stack(children: [
        ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 1, sigmaY: 1.5),
            child: Image.asset(
              "assets/images/BackSign.png",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            )),
        SingleChildScrollView(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: w * .07, bottom: h * .1,top: h*.23),
                child: Text(
                  "_registerAs".tr,
                  style: GoogleFonts.abhayaLibre(
                    textStyle: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: DarkBlue,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: w * .2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w * .01),
                  // color: const Color(0xFF29435c).withOpacity(.55),
                ),
                width: w * .8,
                height: h * .07,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child:  const MedicalTeamSignUp(),
                      ),
                    );
                  },
                  child: AutoSizeText("_medicalTeam".tr),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color(0xFF29435c).withOpacity(.8)),
                  ),
                ),
              ),
              SizedBox(
                height: h*.11,
              ),

              // Container(
              //   margin:
              //       EdgeInsets.symmetric(vertical: w * .1, horizontal: w * .2),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(w * .01),
              //     // color: const Color(0xFF29435c).withOpacity(.55),
              //   ),
              //   width: w * .8,
              //   height: h * .07,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         PageTransition(
              //           type: PageTransitionType.rightToLeft,
              //           child: const MedicalTeamSignUp(),
              //         ),
              //       );
              //     },
              //     child: AutoSizeText("_nurse".tr),
              //     style: ButtonStyle(
              //       backgroundColor: MaterialStateColor.resolveWith(
              //           (states) => const Color(0xFF29435c).withOpacity(.8)),
              //     ),
              //   ),
              // ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: w * .2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w * .01),
                  // color: const Color(0xFF29435c).withOpacity(.55),
                ),
                width: w * .8,
                height: h * .07,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.leftToRight,
                        child: const SignUp(),
                      ),
                    );
                  },
                  child: AutoSizeText("_user".tr),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color(0xFF29435c).withOpacity(.8)),
                  ),
                ),
              )

              // ShapeAcc("Medical team", () {
              //   Navigator.push(
              //     context,
              //     PageTransition(
              //       type: PageTransitionType.rightToLeft,
              //       child: const SignUp(),
              //     ),
              //   );
              // }),
              // ShapeAcc("User", () {
              //   Navigator.push(
              //     context,
              //     PageTransition(
              //       type: PageTransitionType.leftToRight,
              //       child: Nur_SignUp(),
              //     ),
              //   );
              // }),
            ],
          ),
        )
      ]),
    );
  }
}
// class ShapeAcc extends StatelessWidget {
//
//   String ?txt;
//   Function ?function;
//   ShapeAcc(this.txt,this.function, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double h=MediaQuery.of(context).size.height;
//     double w=MediaQuery.of(context).size.width;
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: w*.1,horizontal: w*.2),
//       decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(w*.01),
//       // color: const Color(0xFF29435c).withOpacity(.55),
//
//     ),
//       width: w*.8,
//       height: h*.07,
//       child: ElevatedButton(
//
//         onPressed: (){
//           function!();
//         },
//         child: AutoSizeText(txt!),
//         style: ButtonStyle(
//           backgroundColor:MaterialStateColor.resolveWith((states) =>
//               Color(0xFF29435c).withOpacity(.8)),
//
//       ),
//
//       ),
//     );
//   }
// }
