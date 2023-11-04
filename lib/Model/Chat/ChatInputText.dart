// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes.dart';

class ChatInputText extends StatelessWidget {
  ChatInputText({Key? key, this.hintText, this.onChanged, this.obscureText = false}) : super(key: key);

  Function(String)? onChanged;
  String? hintText;

  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return SizedBox(
      height: h * .2,
      width: w * .8,
      child: TextFormField(
        obscureText: obscureText!,
        validator: (data) {
          if (data!.isEmpty) {
            return '_emptyField'.tr;
          }
          return null;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.send)),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          // enabledBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: Colors.white,
          //   ),
          // ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),

          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1.9,
              color: Color(0xFF324E7B),
            ),
            borderRadius: BorderRadius.circular(w * .06),
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: DarkBlue, width: .9)),
        ),
      ),
    );
  }
}
