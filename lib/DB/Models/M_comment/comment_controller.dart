// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_comment/comment.dart';
import 'package:graduation_project/DB/Models/M_user/user.dart';
import 'package:graduation_project/Model/alart.dart';

class CommentController extends GetxController with StateMixin {
  List commentlist = [];
  var rate = 0.obs;
  // ignore: prefer_typing_uninitialized_variables
  late var avg;

  getcomment(String? userid) async {
    change(null, status: RxStatus.loading());

    await FirebaseFirestore.instance
        .collection('nurse')
        .doc(userid)
        .collection('comments')
        .get()
        .then((value) async {
      for (var commentdoc in value.docs) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(commentdoc.data()['userid'])
            .get()
            .then((value) {
          
          commentlist.add(comment.fromJson(
              commentdoc.data(), UserModel.fromJson(value.data()!)));
        });
      }
    });
    
    change(null, status: RxStatus.success());
  }
  getdoccomment(String? userid) async {
    change(null, status: RxStatus.loading());

    await FirebaseFirestore.instance
        .collection('doctor')
        .doc(userid)
        .collection('comments')
        .get()
        .then((value) async {
      for (var commentdoc in value.docs) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(commentdoc.data()['userid'])
            .get()
            .then((value) {
          
          commentlist.add(comment.fromJson(
              commentdoc.data(), UserModel.fromJson(value.data()!)));
        });
      }
    });
    
    change(null, status: RxStatus.success());
  }

  sendcommenttofb(
      BuildContext context, String nurseid, String Comment, int rating) async {
    try {
      loading(context);
      DocumentReference ref = await FirebaseFirestore.instance
          .collection('nurse')
          .doc(nurseid)
          .collection('comments')
          .add({
        'userid': FirebaseAuth.instance.currentUser!.uid,
        'comment': Comment,
        'rate': rating,
        'createdAt': DateTime.now(),
      });
      List<Map<String, dynamic>> list;

      final comments = await FirebaseFirestore.instance
          .collection('nurse')
          .doc(nurseid)
          .collection('comments')
          .get();
      list = comments.docs.map((doc) => doc.data()).toList();
      for (var comment in comments.docs) {
        int temp;
        temp = comment.data()['rate'];
        rate += temp;
      }
      
      avg = rate / list.length;
      

      await FirebaseFirestore.instance.collection('nurse').doc(nurseid).update({
        'rate': avg,
      });
      rate = 0.obs;

      Get.back();
      return ref;
    } catch (e) {
      
      return null;
    }
  }

  @override
  void onClose() {
    
    avg = 0;
    commentlist.clear();
    super.onClose();
  }
}
