import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Model/AdditionalModel/DrawerItems.dart';
import 'package:graduation_project/themes.dart';

import '../../Model/M_Dashboard/DashModel.dart';

class DashMainHome extends StatefulWidget {
   const DashMainHome({Key? key}) : super(key: key);

  @override
  State<DashMainHome> createState() => _DashMainHomeState();
}

class _DashMainHomeState extends State<DashMainHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: context.theme.backgroundColor,
      // appBar: AppBar(
      //
      //   backgroundColor: const Color(0xFF3A3845),
      //
      //   elevation: 0,
      //   title: const Text("DashBoard",
      //       style: TextStyle(
      //           fontFamily: "Lobster", fontSize: 30, color: white)),
      //
      // ),
      drawer: const Drawer(
        child: DrawerItems(),
      ),
      body: SizedBox(
        height: h,
        width: w,
        child: Stack(
          children: [
            Container(
              height: h * .3,
              width: w,
              // margin: EdgeInsets.only(bottom: h*.12),

              color: PrimaryColor,

              // padding: EdgeInsets.only(
              //     left: w * .04, top: h * .025, bottom: h * .025, right: w * .1),
              // margin:
              //     EdgeInsets.only(left: w * .03, top: h * .02, right: w * .06),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.only(
              //    bottomLeft: Radius.circular(w * .09),
              //     bottomRight: Radius.circular(w * .09),
              //   ),
              // ),
        ),
            Padding(
              padding:  EdgeInsets.only(top:h*.08),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: w * .1,
                      color: white,
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  SizedBox(
                    width: w * .05,
                  ),
                  Text("_dashBoard".tr,
                      style: const TextStyle(
                          fontFamily: "Lobster", fontSize: 28, color: white)),
                ],
              ),
            ),
            Positioned(
        top: h*.18,
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: w*.03,),
          height: h*.8 ,
          width: w * .9,
          child: GridView.builder(
              itemCount: dashConModel.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: .8,
              ),
              itemBuilder: (context, index) =>
                  DashItemModel(dashConM: dashConModel[index])),
        ),
              ),



          ],
        ),
      ),
    );
  }
}
