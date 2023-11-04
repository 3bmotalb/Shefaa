// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_request/requestcontroller.dart';
import 'package:graduation_project/DB/Models/M_request/requesttest.dart';
import 'package:graduation_project/DB/functions.dart';
import 'package:graduation_project/Screens/UI_Nurse_Service/nursenaviationbar.dart';
import '../../themes.dart';
import '../UI_Chat/ChatPage.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  RequestTest request;
  Details({Key? key, required this.request}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  RequestController requestcontroller = Get.put(RequestController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          title: Text(
            '_Details'.tr,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          widget.request.UserStore!.image!,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      widget.request.UserStore!.firstName! +
                          ' ' +
                          widget.request.UserStore!.lastName!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      color: Colors.grey[600],
                      child: Row(
                        children: [
                          const Icon(Icons.home),
                          Expanded(
                            child: Row(
                              children: [
                                Text('_Home'.tr + ': '),
                                Expanded(
                                  child: Text("${widget.request.address}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      color: Colors.grey[600],
                      child: Row(
                        children: [
                          const Icon(Icons.email),
                          Expanded(
                            child: Row(
                              children: [
                                Text('_Details'.tr + ': '),
                                Expanded(
                                  child: Text("${widget.request.description}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      color: Colors.grey[600],
                      child: Row(
                        children: [
                          const Icon(Icons.phone),
                          Text('_Phone'.tr),
                          Text(
                              ":${functions().replaceFarsiNumber(widget.request.UserStore!.phone1!)}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      color: Colors.grey[600],
                      child: Row(
                        children: [
                          const Icon(Icons.timer_outlined),
                          Text('_Date'.tr),
                          Text(
                              ":${functions().Change_Date_Format(widget.request.app!.date!)}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      color: Colors.grey[600],
                      child: Row(
                        children: [
                          const Icon(Icons.timer_outlined),
                          Text('_Time'.tr),
                          Text(
                              ":${functions().replaceFarsiNumber(widget.request.app!.time!)}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      color: Colors.grey[600],
                      child: Row(
                        children: [
                          const Icon(Icons.timer_outlined),
                          Text('_status'.tr + ': '),
                          Text("${widget.request.status}".tr,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                              String chatid = widget.request.UserStore!.userid!
                                      .substring(0, 10) +
                                  widget.request.nurseid!.substring(0, 10);
                              if (await check_chat(chatid)) {
                                Get.to(ChatPage(
                                  chatid: chatid,
                                ));
                              } else {
                                create_chat(
                                    chatid,
                                    widget.request.UserStore!.userid!,
                                    widget.request.nurseid!);
                              }
                            },
                            icon: const Icon(Icons.chat_rounded)),
                        Text('_Chat'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  widget.request.status == 'Pending'
                      ? Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.green,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    await acceptrequest(
                                        widget.request.id,
                                        widget.request.nurseid,
                                        widget.request.appid);
                                    Get.offAll(const nursehomepagenavigation());
                                  },
                                  icon: const Icon(Icons.add_task_outlined)),
                              Text('_Confirm'.tr,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                        )
                      : Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.green,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () async {},
                                  icon: const Icon(Icons.add_task_outlined)),
                              Text('_Finish'.tr,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                        ),
                  const SizedBox(height: 20),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.red,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                              await deleterequest(
                                widget.request.id,
                              );
                            },
                            icon: const Icon(Icons.add_task_outlined)),
                        Text('_cancel'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                  )
                ]))));
  }

  acceptrequest(String? id, String? nurseid, String? appid) async {
    await FirebaseFirestore.instance.collection('request').doc(id).update({
      'status': 'Accepted',
    });
    await FirebaseFirestore.instance
        .collection('nurse')
        .doc(nurseid)
        .collection('appointment')
        .doc(appid)
        .update({
      'booked': true,
    });
    Get.snackbar(
      'Success',
      'Request Accepted',
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  deleterequest(String? id) async {
    await FirebaseFirestore.instance.collection('request').doc(id).update({
      'status': 'Canceld',
    });
    Get.snackbar(
      'Success',
      'Request Deleted',
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
