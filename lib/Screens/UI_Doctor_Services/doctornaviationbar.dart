import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Screens/UI_Doctor_Services/Editprofile_Doctor.dart';
import 'package:graduation_project/Screens/UI_Doctor_Services/HomePage_Doctor.dart';

import '../UI_Chat/Chats.dart';


class doctorhomepagenavigation extends StatefulWidget {
  const doctorhomepagenavigation({Key? key}) : super(key: key);

  @override
  State<doctorhomepagenavigation> createState() => _homepagenavigatioState();
}

class _homepagenavigatioState extends State<doctorhomepagenavigation> {
  int currentindex = 0;
  final screens = [
    HomePage2_d(),
        const Chats(),

    const Account_D(),
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
              icon: const Icon(Icons.chat), label: '_Chat'.tr),
         
          BottomNavigationBarItem(
              icon: const Icon(Icons.menu), label: '_Profile'.tr)
        ],
      ),
      body: screens[currentindex],
    );
  }
}
