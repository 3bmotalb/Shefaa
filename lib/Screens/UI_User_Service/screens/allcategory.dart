import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import 'doctor_list.dart';

class AllCategory extends StatefulWidget {
  const AllCategory({Key? key}) : super(key: key);

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF002536),
        elevation: 10,
        shadowColor: const Color(0xFF002536),
        title: Text(
          '_ShowAllSpecialties'.tr,
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: FirebaseFirestore.instance.collection('category').get(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(doctorlist(
                            category: snapshot.data!.docs[i].id,
                          ));
                        },
                        child: ListTile(
                          // leading: Image.network(
                          //     'https://firebasestorage.googleapis.com/v0/b/shefaa-71c42.appspot.com/o/doctor.png?alt=media&token=a44c10a9-24d5-46f1-a135-e68426afd0fe'),

                          //const Icon(Icons.search),
                          title:
                              Text(snapshot.data!.docs[i].data()['namecat'.tr]),
                        ),
                      );
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
