import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation_project/Screens/UI_Dashboard/DashMainHome.dart';
import 'package:graduation_project/Screens/UI_Sign/UI_Sign_Doctor/DoctorUploads.dart';
import 'package:graduation_project/Screens/UI_Sign/UI_Sign_Doctor/SignUpDoctor.dart';
import 'package:graduation_project/Screens/UI_Sign/UI_Sign_Nurse/NurseUploads.dart';
import 'package:graduation_project/Screens/UI_Sign/UI_Sign_Nurse/SignUpNurse.dart';
import 'package:graduation_project/Screens/UI_SplashScreens/Splash.dart';
import 'package:graduation_project/Services/services.dart';
import 'package:graduation_project/local/locale.dart';
import 'package:graduation_project/local/locale_controller.dart';
import 'package:graduation_project/middleware/auth_middleware.dart';
import 'package:graduation_project/themes.dart';
import 'Screens/UI_Doctor_Services/doctornaviationbar.dart';
import 'Screens/UI_Home/Drawer.dart';
import 'Screens/UI_Nurse_Service/nursenaviationbar.dart';
import 'Screens/UI_User_Service/screens/navigationbar.dart';
import 'Services/S_Medicine/theme_service.dart';

final box = GetStorage();
Future<void> main() async {
  await initiServices();
  print('///////////////////');
  print(box.read('login'));
  print(box.read('type'));
  runApp(const MyApp());
}

Future initiServices() async {
  await Get.putAsync(() => AppServices().init());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MylocaleController locale = Get.put(MylocaleController());
    return GetMaterialApp(
      title: 'Shefaa Application',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      locale: locale.initiallocale,
      translations: Mylocale(),
      // home: NurseInfoArabic(),
      getPages: [
        GetPage(name: '/', page: () => const Splash(),
            // drawer( const Splash()),
            middlewares: [AuthMiddleware()]),
        GetPage(name: '/home_user', page: () => const homepagenavigation()),
        GetPage(
            name: '/home_nurse', page: () => const nursehomepagenavigation()),
        GetPage(
            name: '/home_doctor', page: () => const doctorhomepagenavigation()),
        GetPage(name: '/home_admin', page: () => DashMainHome()),
      ],
    );
  }
}
