import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:graduation_project/DB/Models/M_user/usercontroler.dart';
import 'package:graduation_project/Screens/UI_Doctor_Services/Editprofile_Doctor.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/EditProfile.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/favnurses.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/nurse_booking.dart';
import 'package:graduation_project/themes.dart';

class favtab extends StatefulWidget {
  const favtab({Key? key}) : super(key: key);

  @override
  State<favtab> createState() => _favtabState();
}

class _favtabState extends State<favtab> {
  UserControler usercontroller = Get.put(UserControler());

  void initState() {
    super.initState();
    usercontroller.getfav(FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usercontroller.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return usercontroller.obx((state) {
      return DefaultTabController(
          length: 2,
          child: Scaffold(
              backgroundColor: context.theme.backgroundColor,
              appBar: AppBar(
                  backgroundColor: PrimaryColor,
                  title: Text(
                    "_Favourite".tr,
                    style: const TextStyle(color: Colors.white),
                  ),
                  bottom: TabBar(
                    tabs: <Widget>[
                      Tab(
                          icon: const Icon(Icons.favorite),
                          text: ('_nurse'.tr)),
                      Tab(
                          icon: const Icon(Icons.favorite),
                          text: ('_doctor'.tr)),
                    ],
                  )),
              body: TabBarView(
                children: [
                  favnurses(favlist: usercontroller.favnurse),
                  favdoctors(favlist: usercontroller.favdoctor),
                ],
              )));
    },
        onLoading: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
