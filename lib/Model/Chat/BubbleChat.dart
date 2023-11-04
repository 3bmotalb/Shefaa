// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:graduation_project/Model/Chat/message.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(
            left: w * .04, top: h * .025, bottom: h * .025, right: w * .1),
        margin: EdgeInsets.only(left: w * .03, top: h * .02, right: w * .06),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(w * .09),
            topRight: Radius.circular(w * .09),
            bottomRight: Radius.circular(w * .09),
          ),
          color: const Color(0xFF27496D),
        ),
        child: Text(
          message.message,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
            fontSize:16 ,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ChatBubble2 extends StatelessWidget {
  const ChatBubble2({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(
            left: w * .04, top: h * .025, bottom: h * .025, right: w * .1),
        margin: EdgeInsets.only(left: w * .03, top: h * .02, right: w * .06),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(w * .09),
            topRight: Radius.circular(w * .09),
            bottomLeft: Radius.circular(w * .09),
          ),
          color: const Color(0xFFD7E9F7),
        ),
        child: Text(
          message.message,
          // message.message,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
            fontSize:16 ,
            color: Color(0xFF456268),
          ),
        ),
      ),
    );
  }
}
