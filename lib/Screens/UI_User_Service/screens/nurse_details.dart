// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_comment/comment_controller.dart';
import 'package:graduation_project/DB/Models/M_nurse/nurse_controller.dart';
import 'package:graduation_project/DB/Models/M_nurse/nurse_model.dart';
import 'package:graduation_project/DB/Models/M_user/usercontroler.dart';
import 'package:graduation_project/Screens/UI_Nurse_Service/comments.dart';
import 'package:graduation_project/themes.dart';
import 'nurse_schedule.dart';

class nursedata extends StatefulWidget {
  NurseModel nurse;

  nursedata({Key? key, required this.nurse}) : super(key: key);

  @override
  State<nursedata> createState() => _nursedataState();
}

class _nursedataState extends State<nursedata> {
  UserControler userControler = Get.find();
  NurseController nurseController = Get.put(NurseController());
  CommentController c = Get.put(CommentController());

  TextEditingController commentcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    nurseController.getdatatouser(widget.nurse.userid!);
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
      Column(children: [
        Container(
          color: PrimaryColor,
          //const Color(0xffFF9A2B),
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(widget.nurse.image!),
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
              Container(
                margin: EdgeInsets.only(left: 60),
                width: 120,
                height: 20,
                child: FittedBox(
                  fit: BoxFit.none,
                  child: Text(
                    widget.nurse.full_name!,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
                    /* Container(
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
                        (widget.nurse.bio!),
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
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
                        (widget.nurse.workplace!),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
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
                      color: Color.fromARGB(255, 12, 132, 230),
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        (widget.nurse.phone1!),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              /*Container(
                margin: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        (widget.nurse.rate!).toStringAsFixed(1),
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),*/
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
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
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          // commentcontroller.avg.toString(),
                          (widget.nurse.rate!).toStringAsFixed(1),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
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
            ],
          ),
        )
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
        /*
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                          (widget.nurse.rate!).toStringAsFixed(1),
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
                  width: 50,
                ),
                Icon(
                  Icons.attach_money,
                  size: 50,
                  color: Colors.green,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          // commentcontroller.avg.toString(),
                          // (widget.nurse.rate!).toStringAsFixed(1),
                          "25",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Icon(
                          Icons.attach_money_rounded,
                          color: Colors.green,
                          size: 25,
                        )
                      ],
                    ),
                    Text(
                      // '_Rate'.tr,
                      "price",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),*/
        ,
        //const SizedBox(height: 10),
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '_aboutnurse'.tr,
                style: const TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              widget.nurse.bio!,
              style: const TextStyle(fontSize: 18),
              minFontSize: 15,
              maxLines: 5,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SizedBox(height: 10),
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
                  Get.to(Comments(nurseid: widget.nurse.userid!));
                },
                icon: const Icon(Icons.comment),
                label: Text('_Comments'.tr),
                style: ElevatedButton.styleFrom(
                    primary: PrimaryColor,
                    //const Color(0xffFF9A2B),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // sendRequesttofb();
                  Get.to(nursschedule(
                    nurse: widget.nurse,
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
        /* Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "_Comments".tr,
                    style: const TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.to(Comments(nurseid: widget.nurse.userid!));
                      },
                      icon: const Icon(Icons.arrow_forward_ios)),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // sendRequesttofb();
                Get.to(nursschedule(
                  nurse: widget.nurse,
                ));
              },
              icon: const Icon(Icons.calendar_today),
              label: Text('_Appointments'.tr),
              style: ElevatedButton.styleFrom(
                  primary: const Color(0xffFF9A2B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(height: 10),
          ],
        ),*/
      ]),
    ]));
  }
}
