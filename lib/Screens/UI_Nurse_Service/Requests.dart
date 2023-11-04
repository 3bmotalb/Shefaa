// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/DB/Models/M_request/requestcontroller.dart';
import 'package:graduation_project/DB/Models/M_request/requesttest.dart';
import 'package:intl/intl.dart';
import '../../themes.dart';
import 'Details.dart';
import 'package:get/get.dart';

class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);

  @override
  State<Request> createState() => _RequestState();
}

RequestController requestcontroller = Get.put(RequestController());

class _RequestState extends State<Request> {
  @override
  void initState() {
    super.initState();
    requestcontroller.getrquests(FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  void dispose() {
    super.dispose();
    requestcontroller.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return requestcontroller.obx((state) {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          title: Text(
            '_requests'.tr,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: requestcontroller.requests.isNotEmpty
            ? ListView.builder(
                itemCount: requestcontroller.requests.length,
                itemBuilder: (context, index) {
                  RequestTest request = requestcontroller.requests[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          request.UserStore!.image!,
                        ),
                      ),
                      title: Text(
                        request.UserStore!.firstName! +
                            ' ' +
                            request.UserStore!.lastName!,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat('dd-MM-yyyy')
                                .format(request.requestdate!.toDate()),
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            DateFormat.jm()
                                .format(request.requestdate!.toDate()),
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          Get.to(Details(
                            request: request,
                          ));
                        },
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: Text(
                  "لسه ما استفتحنااااش",
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
