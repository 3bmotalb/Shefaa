// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/DB/Models/M_comment/comment_controller.dart';
import 'package:graduation_project/DB/Models/M_doctor/doctorcontroller.dart';
import 'package:graduation_project/DB/Models/M_doctor/doctormodel.dart';
import 'package:graduation_project/DB/Models/M_nurse/nurse_controller.dart';
import 'package:graduation_project/DB/Models/M_nurse/nurse_model.dart';
import 'package:graduation_project/DB/Models/M_user/usercontroler.dart';
import 'package:graduation_project/Screens/UI_Nurse_Service/comments.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/doctorschedule.dart';
import 'package:graduation_project/themes.dart';
import 'nurse_schedule.dart';
import 'package:like_button/like_button.dart';

class doctordata extends StatefulWidget {
  DoctorModel doctor;

  doctordata({Key? key, required this.doctor}) : super(key: key);

  @override
  State<doctordata> createState() => _nursedataState();
}

class _nursedataState extends State<doctordata> {
  /* UserControler userControler = Get.find();
  DoctorController doctorController = Get.put(DoctorController());
  CommentController c = Get.put(CommentController());

  TextEditingController commentcontroller = TextEditingController();*/
  @override
  void initState() {
    super.initState();
    //DoctorController.getdatatouser(widget.nurse.userid!);
  }

  bool isbuttonpressed = true;
  void buttonpressed() {
    setState(() {
      if (isbuttonpressed = false) {
        isbuttonpressed = true;
      } else if (isbuttonpressed = true) {
        isbuttonpressed = false;
      }
    });
  }
  // sendcommenttofb(String Comment, int rate) async {
  //   try {
  //     loading(context);
  //     DocumentReference ref = await FirebaseFirestore.instance
  //         .collection('nurse')
  //         .doc(widget.nurse.userid)
  //         .collection('comments')
  //         .add({
  //       'userid': FirebaseAuth.instance.currentUser!.uid,
  //       'comment': Comment,
  //       'rate': rate,
  //       'user_name': userControler.user!.firstName! +
  //           ' ' +
  //           userControler.user!.lastName!,
  //       'user_image': userControler.user!.image,
  //     });
  //     Get.back();
  //     return ref;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  double rating = 3.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            Container(
              color: PrimaryColor,
              //const Color(0xffFF9A2B),
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(widget.doctor.image!),
                radius: 24.0,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              margin: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 60),
                        width: 200,
                        height: 20,
                        child: FittedBox(
                          fit: BoxFit.none,
                          child: Center(
                            child: Text(
                              'Dr'.tr + widget.doctor.full_name!,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      /* IconButton(
                        onPressed: buttonpressed,
                        icon: Icon(Icons.favorite),
                        color: //Colors.red,
                            isbuttonpressed
                                ? Color.fromARGB(255, 243, 17, 14)
                                : Colors.grey,
                      ),*/
                      LikeButton(),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                    ),
                    child: Row(
                      children: [
                        /*  Container(
                          margin: EdgeInsets.only(bottom: 25),
                          alignment: Alignment.topCenter,
                          child: Icon(
                            Icons.medical_services,
                            color: Colors.blue[400],
                            size: 20,
                          ),
                        ),*/
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            (widget.doctor.bio!),
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            (widget.doctor.clinic_address!),
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.blue[400],
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            (widget.doctor.clinic_phone!),
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            /* Card(
              child: RatingBar.builder(
                initialRating: rating, //widget.nurse.gender!.toDouble(),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                updateOnDrag: false,

                onRatingUpdate: (rating) {},
              ),
            ),*/
            /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    "assets/rating.png",
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          // commentcontroller.avg.toString(),
                          (widget.doctor.rate!).toStringAsFixed(1),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 25,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '_Rate'.tr,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),*/
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                            width: .5,
                          )),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "_Rate".tr,
                              // (widget.doctor.clinic_address!),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                // commentcontroller.avg.toString(),
                                (widget.doctor.rate!).toStringAsFixed(1),
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                            width: .5,
                          )),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              '_Price'.tr,
                              // (widget.doctor.clinic_address!),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                // commentcontroller.avg.toString(),
                                (widget.doctor.vezeta!).toStringAsFixed(1),
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              const Icon(
                                Icons.attach_money,
                                color: Colors.green,
                                size: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Aboutt'.tr,
                    //'_aboutnurse'.tr,
                    style: const TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  widget.doctor.bio!,
                  style: const TextStyle(fontSize: 18),
                  minFontSize: 15,
                  maxLines: 5,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /* Text(
                    "_Comments".tr,
                    style: const TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.to(Comments(nurseid: widget.doctor.userid!));
                      },
                      icon: const Icon(Icons.arrow_forward_ios)),*/
                  ElevatedButton.icon(
                    onPressed: () {
                      // sendRequesttofb();
                      Get.to(Comments(nurseid: widget.doctor.userid!));
                    },
                    icon: const Icon(Icons.comment),
                    label: Text('_Comments'.tr),
                    style: ElevatedButton.styleFrom(
                        primary: PrimaryColor,
                        //const Color(0xffFF9A2B),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  /*  SizedBox(
                    width: 10,
                  ),*/
                  ElevatedButton.icon(
                    onPressed: () {
                      // sendRequesttofb();
                      Get.to(doctorschedule(
                        doctor: widget.doctor,
                      ));
                    },
                    icon: const Icon(Icons.calendar_today),
                    label: Text('_Appointments'.tr),
                    style: ElevatedButton.styleFrom(
                        primary: PrimaryColor,
                        //const Color(0xffFF9A2B),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ]),
    );
  }
}
