// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_comment/comment.dart';
import 'package:graduation_project/DB/Models/M_comment/comment_controller.dart';
import 'package:graduation_project/DB/functions.dart';

import '../../themes.dart';

class Comments extends StatefulWidget {
  String nurseid;
  Comments({Key? key, required this.nurseid}) : super(key: key);

  @override
  State<Comments> createState() => _CommentsState();
}

final commentcontroller = Get.put(CommentController());

class _CommentsState extends State<Comments> {
  @override
  void initState() {
    super.initState();
    commentcontroller.getcomment(widget.nurseid);
  }

  @override
  void dispose() {
    super.dispose();
    commentcontroller.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return commentcontroller.obx((state) {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              }),
          title: Text(
            '_CommentsList'.tr,
            style: const TextStyle(color: Colors.black),
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
                    Expanded(
                      child: Text(
                        functions().replaceFarsiNumber(
                            commentcontroller.commentlist.length.toString()),
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '_Comments'.tr,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
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
                      color: Colors.grey[350],
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
                              color: Color.fromARGB(255, 101, 97, 97),
                              fontSize: 25,
                            ),
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
