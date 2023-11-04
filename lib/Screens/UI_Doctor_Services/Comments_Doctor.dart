import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation_project/DB/Models/M_comment/comment.dart';
import 'package:graduation_project/DB/Models/M_comment/comment_controller.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/nurse_booking.dart';

class Comments extends StatefulWidget {
  String doctorid;
  Comments({Key? key, required this.doctorid}) : super(key: key);

  @override
  State<Comments> createState() => _CommentsState();
}

final commentcontroller = Get.put(CommentController());

class _CommentsState extends State<Comments> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    commentcontroller.getcomment(widget.doctorid);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    commentcontroller.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return commentcontroller.obx((state) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 156, 191, 219),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              }),
          title: const Text(
            "Comments List",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  children: [
                    Text(
                      commentcontroller.commentlist.length.toString(),
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Comments",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ]),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: commentcontroller.commentlist.length,
                itemBuilder: (context, i) {
                  comment comments = commentcontroller.commentlist[i];
                  return Container(
                    margin: const EdgeInsets.all(7),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comments.user!.firstName.toString() +
                                " " +
                                comments.user!.lastName.toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          RatingBar(
                            initialRating: comments.rate!.toDouble(),
                            onRatingUpdate: (double value) {},
                            ratingWidget: RatingWidget(
                              full: const Icon(Icons.star, color: Colors.amber),
                              half: const Icon(Icons.star_half_outlined,
                                  color: Colors.amber),
                              empty: const Icon(
                                Icons.star_border_outlined,
                              ),
                            ),
                          ),
                          Text(
                            comments.text.toString(),
                            style: const TextStyle(
                                color: const Color.fromARGB(255, 101, 97, 97)),
                          ),
                        ]),
                  );
                },
              ),
            ),
          ],
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
