import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/main.dart';

class MylocaleController extends GetxController {

  Locale get initiallocale =>
      box.read('locale') == null ?  Get.deviceLocale! : Locale(box.read('locale')!);

 

  void changeLanguage(String lang) {
    Locale locale = Locale(lang);
    box.write('locale', lang);
    Get.updateLocale(locale);
  }
}
