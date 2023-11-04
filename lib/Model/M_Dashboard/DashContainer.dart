// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DashContainer extends StatelessWidget {
  String? img, tittle, subtittle;
  Color? clr;
  Function function;

  DashContainer(
      {Key? key,
        this.img,
        this.tittle,
        this.subtittle,
        this.clr,
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
        height: h * .15,
        width: w * .2,
        margin: EdgeInsets.all(h * .008),
        // padding: EdgeInsets.only(left: w * .001,right: w*.02),
        decoration: BoxDecoration(
          color: clr,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(w * .25),
            bottomLeft: Radius.circular(w * .13),
            bottomRight: Radius.circular(w * .25),
            topRight: Radius.circular(w * .13),
          ),
        ),
        alignment: Alignment.topLeft,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: h * .012),
          height: h * .35,
          width: w * .85,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: h * .05),
                child: Image.asset(
                  "$img",
                  width: w * .1,
                  height: h * .2,
                  alignment: Alignment.center,
                ),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    tittle!.tr,
                    style: const TextStyle(
                        fontFamily: "Lobster",
                        fontSize: 24,
                        color: Color(0xFF002536)),
                  ),
                  Divider(
                    indent: w * .03,
                    endIndent: w * .03,
                    thickness: 2,
                    color: const Color(0XFF002536),
                  ),
                  SizedBox(
                    width: w * .5,
                    child: AutoSizeText(
                      subtittle!.tr,
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
