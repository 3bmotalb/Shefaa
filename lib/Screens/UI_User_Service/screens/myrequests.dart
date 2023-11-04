import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_comment/comment_controller.dart';
import 'package:graduation_project/DB/Models/M_request/requestcontroller.dart';
import 'package:graduation_project/DB/Models/M_request/requesttest.dart';
import 'package:graduation_project/DB/functions.dart';
import 'package:graduation_project/Screens/UI_Chat/ChatPage.dart';
import 'package:graduation_project/Screens/UI_User_Service/components/input_filed.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/nurse_details.dart';
import 'package:graduation_project/themes.dart';

class MyRequests extends StatefulWidget {
  const MyRequests({Key? key}) : super(key: key);

  @override
  State<MyRequests> createState() => _MyRequestsState();
}

RequestController requestcontroller = Get.put(RequestController());
CommentController c = Get.put(CommentController());

TextEditingController commentcontroller = TextEditingController();

class _MyRequestsState extends State<MyRequests> {
  @override
  void initState() {
    super.initState();
    requestcontroller.getrqueststouser(FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  void dispose() {
    super.dispose();
    requestcontroller.onClose();
  }

  @override
  Widget build(BuildContext context) {
    double rating = 0;

    return requestcontroller.obx((state) {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          centerTitle: true,
          elevation: 4,
          title: Text(
            '_activity'.tr,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: white),
          ),
        ),
        body: requestcontroller.requests.isNotEmpty
            ? ListView.builder(
                itemCount: requestcontroller.requests.length,
                itemBuilder: (context, index) {
                  RequestTest request = requestcontroller.requests[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(nursedata(
                        nurse: request.NurseStore!,
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Center(
                                child: Row(
                                  children: [
                                    request.status == 'Accepted'
                                        ? Text(
                                            request.status!.tr + '   ',
                                            style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 18),
                                          )
                                        : request.status == 'Pending'
                                            ? Text(
                                                request.status!.tr + '   ',
                                                style: const TextStyle(
                                                    color: Colors.orange,
                                                    fontSize: 18),
                                              )
                                            : Text(
                                                request.status!.tr + '   ',
                                                style: const TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 18),
                                              ),
                                    Text('_visit'.tr +
                                        ' ${functions().Change_Date_Format(request.requestdate!)}   ' +
                                        ' ')
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 80,
                                    width: 80,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          request.NurseStore!.image!),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        request.NurseStore!.full_name!,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '_Nurse'.tr,
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.grey),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              request.status == "Accepted"
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                            onPressed: () async {
                                              String chatid = FirebaseAuth
                                                      .instance.currentUser!.uid
                                                      .substring(0, 10) +
                                                  request.NurseStore!.userid!
                                                      .substring(0, 10);
                                              if (await check_chat(chatid)) {
                                                Get.to(ChatPage(
                                                  chatid: chatid,
                                                ));
                                              } else {
                                                create_chat(
                                                    chatid,
                                                    FirebaseAuth.instance
                                                        .currentUser!.uid,
                                                    request
                                                        .NurseStore!.userid!);
                                              }
                                            },
                                            icon: const Icon(
                                              Icons.chat,
                                              size: 30,
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              Get.defaultDialog(
                                                  title: 'Rating',
                                                  content: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      RatingBar.builder(
                                                        initialRating: 0,
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                        ),
                                                        onRatingUpdate:
                                                            (double value) {
                                                          setState(() {
                                                            rating = value;
                                                          });
                                                        },

                                                        //widget.nurse.
                                                      ),
                                                      inputfiled(
                                                        title: 'comment',
                                                        hint: 'Type comment',
                                                        controller:
                                                            commentcontroller,
                                                      ),
                                                    ],
                                                  ),
                                                  onCancel: () {
                                                    Get.back();
                                                  },
                                                  onConfirm: () async {
                                                    await c.sendcommenttofb(
                                                        context,
                                                        request.nurseid!,
                                                        commentcontroller.text,
                                                        rating.toInt());
                                                    rating = 0;
                                                    commentcontroller.clear();
                                                    Get.back();
                                                  });
                                            },
                                            icon: const Icon(
                                              Icons.rate_review_sharp,
                                              size: 30,
                                            )),
                                      ],
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: Text(
                  "No Activity Yet",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
      );
    },
        onLoading: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
