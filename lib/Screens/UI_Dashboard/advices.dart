// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/functions.dart';
import 'package:graduation_project/themes.dart';

import '../UI_Medicine/home_page.dart';

class Advises extends StatefulWidget {
  const Advises({Key? key}) : super(key: key);

  @override
  State<Advises> createState() => _AdvisesState();
}

TextEditingController advicecontroller = TextEditingController();

class _AdvisesState extends State<Advises> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text("_Advices".tr),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('advices')
                .orderBy('date', descending: true)
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    Timestamp date = snapshot.data.docs[index].data()['date'];
                    return GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        child: Card(
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Text(
                                  snapshot.data.docs[index].data()['text'],
                                  textDirection: TextDirection.rtl,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      functions().Change_Date_Format(date),
                                      textDirection: TextDirection.rtl,
                                    ),
                                    Text(
                                      functions().Change_Time_Format(date),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
      floatingActionButton: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.blue,
        child: IconButton(
          icon: const Icon(
            Icons.add,
          ),
          onPressed: () {
            Get.bottomSheet(
              Container(
                padding: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * .6,
                width: MediaQuery.of(context).size.width * .9,
                color: context.theme.backgroundColor,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '_Advice'.tr,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        controller: advicecontroller,
                        minLines: 2,
                        maxLines: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('advices')
                              .add({
                            'text': advicecontroller.text,
                            'date': Timestamp.now(),
                          });
                          advicecontroller.clear();
                          Get.back();
                        },
                        child: Text(
                          '_add'.tr,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
