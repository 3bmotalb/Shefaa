import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:graduation_project/Screens/UI_Chat/Chats.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/EditProfile.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/myrequests.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/user_homepage.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/user_homepage1.dart';

import '../../UI_Chat/Chats.dart';

class homepagenavigation extends StatefulWidget {
  const homepagenavigation({Key? key}) : super(key: key);

  @override
  State<homepagenavigation> createState() => _homepagenavigatioState();
}

class _homepagenavigatioState extends State<homepagenavigation> {
  int currentindex = 0;
  final screens = [
    UserHomePage(),
    const MyRequests(),
    const Chats(),
    const Account(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF002536),
        showUnselectedLabels: false,
        // selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 189, 188, 188),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentindex,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home), label: '_home'.tr),
          BottomNavigationBarItem(
              icon: const Icon(Icons.supervisor_account_rounded),
              label: '_activity'.tr),
          BottomNavigationBarItem(
              icon: const Icon(Icons.chat), label: '_Chat'.tr),
          BottomNavigationBarItem(
              icon: const Icon(Icons.menu), label: '_Profile'.tr)
        ],
      ),
      body: screens[currentindex],
    );
  }
}
