import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Screens/UI_Chat/Chats.dart';
import 'package:graduation_project/Screens/UI_Nurse_Service/EditProfile.dart';
import 'package:graduation_project/Screens/UI_Nurse_Service/Homepage-nurse.dart';
import 'package:graduation_project/Screens/UI_Nurse_Service/Requests.dart';

class nursehomepagenavigation extends StatefulWidget {
  const nursehomepagenavigation({Key? key}) : super(key: key);

  @override
  State<nursehomepagenavigation> createState() => _homepagenavigatioState();
}

class _homepagenavigatioState extends State<nursehomepagenavigation> {
  int currentindex = 0;
  final screens = [
    HomePage2(),
    const Request(),
    const Chats(),
    const Account_N(),
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
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home), label: '_home'.tr),
          BottomNavigationBarItem(
              icon: const Icon(Icons.supervisor_account_rounded),
              label: '_requests'.tr),
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
