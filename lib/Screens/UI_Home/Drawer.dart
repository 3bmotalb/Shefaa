// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Model/AdditionalModel/DrawerItems.dart';
import 'package:graduation_project/Screens/UI_Home/MainScreen.dart';

import 'package:graduation_project/themes.dart';


import '../UI_Chat/Chats.dart';



class drawer extends StatefulWidget {
  Widget? scf;
  drawer(this.scf, {Key? key}) : super(key: key);

  @override
  _drawerState createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  bool? isloging;
  @override
  void initState() {
    pages.add(const MainHome());
    pages.add(const Chats());
    super.initState();
    //check if ther user loging or not
  }

  final List<Widget> pages = <Widget>[];
  // final int _selectedIndex = 0;

  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return AdvancedDrawer(
      backdropColor: PrimaryColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      disabledGestures: false,

      // rtlOpening: true,

      childDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(w * .01)),
      ),
      child: Scaffold(
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: PrimaryColor,
        //   selectedItemColor: white,
        //   unselectedItemColor: DarkBlue,
        //   currentIndex: _selectedIndex,
        //   onTap: (index) {
        //     setState(() {
        //       _selectedIndex = index;
        //     });
        //   },
        //   items: <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: const Icon(Icons.home),
        //       label: '-home'.tr,
        //     ),
        //     BottomNavigationBarItem(
        //       icon: const Icon(Icons.chat),
        //       label: '_chats'.tr,
        //     ),
        //   ],
        // ),
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: AutoSizeText('1'.tr),
          centerTitle: true,
          backgroundColor: PrimaryColor,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.tips_and_updates),
              tooltip: "_todayMessage".tr,
            )
          ],
          elevation: 4,
          // shadowColor:PrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(w * .07),
              bottomRight: Radius.circular(w * .07),
            ),
          ),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  // child: Container(
                  //   margin: EdgeInsets.only(left: w * .03),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                  // ),
                );
              },
            ),
          ),
        ),
        body:
        const MainHome(),
        //      const ChooseAcc()
            // pages[_selectedIndex],
      ),
      drawer: const DrawerItems(),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
