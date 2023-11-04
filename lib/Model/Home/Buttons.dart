// ignore_for_file: file_names

import 'package:flutter/material.dart';


// ignore: must_be_immutable
class Buttons extends StatelessWidget {
String txt;
int clr;
Function function;
Icon icon;
Buttons(this.txt,this.clr,this.function,this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return FloatingActionButton.extended(
      icon: icon,
      label: Text(txt),
      heroTag: null,
      extendedPadding:
          EdgeInsets.symmetric(horizontal: w * .2, vertical: h * .5),
      backgroundColor: Color(clr).withOpacity(.56),
      onPressed: () {
        function();
      },
    );
  }
}
