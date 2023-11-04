// ignore_for_file: file_names, must_be_immutable, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes.dart';

// bool? obscureVal;
// Icon? preIcon;
// IconButton? sufIcon;
// String? hintTxt, lblText;
// TextInputType? inputType;
// // String ?savedTxt;
// TextEditingController? controller = TextEditingController();
class TxtFormField extends StatelessWidget {
  String? hintTxt;
  TextInputType? inputType;
  String lblText;
  Icon? preIcon;
  IconButton? sufIcon;
  bool? obscureVal;
  TextEditingController? controller;
  int? maxLines;

  TxtFormField(
    this.hintTxt,
    this.inputType,
    this.lblText,
    this.preIcon,
    this.sufIcon,
    this.obscureVal,
    this.controller, {
    Key? key,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: w * .001, vertical: h * .02),
      child: TextFormField(


        cursorColor: DarkBlue,
        style: const TextStyle(color: Color(0xFF1D242B),overflow: TextOverflow.visible),

        controller: controller,
        // onSaved: (String ? value){
        //   value=savedTxt;
        // },

        obscureText: obscureVal!,
        keyboardType: inputType,

        validator: (value) {
          if (value == null || value.isEmpty) {
            return ("_emptyField".tr);
          } else {
            return null;
          }
        },
        maxLength: maxLines,
        decoration: InputDecoration(
          prefixIcon: preIcon,

          // prefixIconColor: Get.isDarkMode ? Colors.grey[700] :Colors.grey[700],
          suffixIcon: sufIcon,
          // suffixIconColor: Get.isDarkMode ? Colors.grey[700] :Colors.grey[700],
          hintText: hintTxt,
          hintStyle: TextStyle(
            overflow: TextOverflow.visible,
              color: Get.isDarkMode ? Colors.grey[700] : Colors.grey[700]),

          // iconColor: Colors.yellow,
          // label: Text(lblText),
          // iconColor: ,

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

class TxtButton extends StatelessWidget {
  Function? function;
  String? txt;
  Color? color;
  TextStyle? style;

  TxtButton({Key? key, this.function, this.txt, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          function!();
        },
        child: Text(
          txt!,
          style: style,
        ));
  }
}
