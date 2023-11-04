// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';

import '../../themes.dart';

// ignore: must_be_immutable
class ContainerItem extends StatelessWidget {
  String? img, tittle, subtittle;
  Color? clr,darkClr;
  Function function;

  ContainerItem(
      {Key? key,
      this.img,
      this.tittle,
      this.subtittle,
      this.clr,
        this.darkClr,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        height: h * .3,
        width: w * .9,
        margin: EdgeInsets.all(h * .008),
        // padding: EdgeInsets.only(left: w * .001,right: w*.02),
        decoration: BoxDecoration(
          color: Get.isDarkMode ? darkClr : clr,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(w * .25),
            bottomLeft: Radius.circular(w * .13),
            bottomRight: Radius.circular(w * .25),
            topRight: Radius.circular(w * .13),
          ),
        ),
        alignment: Alignment.topLeft,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: h * .023),
          height: h * .38,
          width: w * .85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: h * .05),
                child: Image.asset(
                  "$img",
                  width: w * .3,
                  height: h * .35,
                  alignment: Alignment.topLeft,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    tittle!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Color(0xFF002536)),
                  ),
                  Divider(
                    indent: w * .03,
                    endIndent: w * .03,
                    thickness: 1,
                    color: Get.isDarkMode
                        ? white
                        : Colors.grey[700],
                  ),
                  SizedBox(
                    height: h * .15,
                    width: w * .55,
                    child: AutoSizeText(
                      subtittle!,
                      style: TextStyle(
                        fontSize: 18,
                        color: Get.isDarkMode
                            ? const Color(0xFF181818)
                            : Colors.grey[700],
                      ),
                      // textAlign: TextAlign.left,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
