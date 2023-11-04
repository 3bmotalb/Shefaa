import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation_project/local/locale_controller.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../DB/DB_Medicine/db_helper.dart';

class AppServices extends GetxService {
  

  
  Future<AppServices> init() async {
          

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    
    await DBHelper.initDb();
    await GetStorage.init();
    MylocaleController locale = Get.put(MylocaleController());
    
    initializeDateFormatting(locale.initiallocale.languageCode, null);
    return this;
  }

  
}
