import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/main.dart';

class AuthMiddleware extends GetMiddleware {


  @override
  RouteSettings? redirect(String? route) {
    if(box.read('login')!=null&&box.read('type') == 'user') {
      return const RouteSettings(name: '/home_user');
    }
    if (box.read('login') != null && box.read('type') == 'nurse') {
      return const RouteSettings(name: '/home_nurse');
    }
    if (box.read('login') != null && box.read('type') == 'doctor') {
      return const RouteSettings(name: '/home_doctor');
    }
    if (box.read('login') != null && box.read('type') == 'admin') {
      return const RouteSettings(name: '/home_admin');
    }
    return null;
    
  }
  // @override
  // RouteSettings? redirect(String? route) {
  //   if (box.read('login') == null) {
  //     return RouteSettings(name: '/home');
  //   } else if (box.read('login') != null && box.read('type') == 'nurse') {
  //     return RouteSettings(name: '/home_nurse');
  //   } else if (box.read('login') != null && box.read('type') == 'user') {
  //     return RouteSettings(name: '/home_user');
  //   } else if (box.read('login') != null && box.read('type') == 'doctor') {
  //     return RouteSettings(name: '/home_doctor');
  //   }
  //   return null;
  // }
}

// if(_box.read('login') == null || _box.read('login') == false)
//        SignIn();
//       else if(_box.read('login') && _box.read('type') == 'nurse')
//       Get.offAll(const nursehomepagenavigation())
//       else if(_box.read('login') && _box.read('type') == 'user')
//       Get.offAll(const homepagenavigation())
//       else if(_box.read('login') && _box.read('type') == 'doctor')
//       Get.offAll(HomePage2_d())
//       else
