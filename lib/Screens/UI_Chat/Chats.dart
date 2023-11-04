// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation_project/DB/Models/M_Chat/chat.dart';
import 'package:graduation_project/DB/Models/M_user/user.dart';
import 'package:graduation_project/main.dart';
import 'package:graduation_project/themes.dart';
import '../../DB/Models/M_nurse/nurse_model.dart';
import '../../Model/Chat/MainChatsModel.dart';
import '../Additional/NoConnection.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (box.read('login') == true) {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,

        appBar: AppBar(
          backgroundColor: PrimaryColor,
          elevation: 4,
          centerTitle: true,
          title: Text(
            "_chats".tr,
            style: const TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "Cairo",
              fontSize:20 ,),
          ),
        ),
        body: Center(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('chat')
                    .where('users',
                        arrayContains: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          ChatModel chat = ChatModel.fromJson(
                              snapshot.data!.docs[index].data());
                          var array =
                              snapshot.data!.docs[index].data()['users'];
                          var userid = array.firstWhere((element) =>
                              element !=
                              FirebaseAuth.instance.currentUser!.uid);

                          if (box.read('type') == 'user') {
                            return FutureBuilder(
                                future: FirebaseFirestore.instance
                                    .collection('nurse')
                                    .doc(userid)
                                    .get(),
                                builder: (context, AsyncSnapshot snap) {
                                  if (snap.hasData) {
                                    NurseModel nurse = NurseModel.fromJson(
                                        snap.data!.data(), '', '');

                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: ModelChat(
                                        chat: chat,
                                        store: nurse,
                                      ),
                                    );
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                });
                          } else if (box.read('type') == 'nurse') {
                            return FutureBuilder(
                                future: FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(userid)
                                    .get(),
                                builder: (context, AsyncSnapshot snap) {
                                  if (snap.hasData) {
                                    UserModel user =
                                        UserModel.fromJson(snap.data!.data());

                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: ModelChat(
                                        chat: chat,
                                        store: user,
                                      ),
                                    );
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                });
                          } else {
                            return const Center();
                          }
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })
            //     ListView.separated(
            //   separatorBuilder: (context, index) => const Divider(
            //     thickness: 2,
            //   ),
            //   itemCount: 5,
            //   itemBuilder: (context, index) => const Padding(
            //     padding: EdgeInsets.all(5),
            //     child: ModelChat(),
            //   ),
            // )
            ),
      );
    } else {
      return const NoConn();
      //   Center(
      //   child: Column(
      //     children: [
      //       Text("No chats"),
      //       Text("Login to see chats"),
      //     ],
      //   ),
      // );
    }
  }
}
