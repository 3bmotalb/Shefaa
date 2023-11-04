import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NoConn extends StatefulWidget {
  const NoConn({Key? key}) : super(key: key);

  @override
  State<NoConn> createState() => _NoConnState();
}

class _NoConnState extends State<NoConn> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: w * .04, vertical: h * .1),
        children: [
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: h * .1),
              height: h * .25,
              width: w * .45,
              child: Image.asset("assets/images/noConn2.png")),
          const Text(
            "You're offline!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(
            height: h * .02,
          ),
          const Text(
            "Check your connection and try again",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
          ),
          // Container(
          //     height: h * .07,
          //     width: w * .1,
          //     margin: EdgeInsets.only(left: w * .5, top: h * .2),
          //     color: Colors.grey[700],
          //     child: FittedBox(
          //         child: TxtButton(
          //           txt: "Reconnect",
          //           function: () {},
          //         )))
        ],
      ),
    );
  }
}
