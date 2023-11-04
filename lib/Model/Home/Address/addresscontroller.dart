// ignore_for_file: camel_case_types, unused_import

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:get_storage/get_storage.dart';

class addcontroller extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await readJson();
  }

  // ignore: unused_field
  RxString city = ''.obs;
  RxInt cityid = 0.obs;
  RxString government = ''.obs;
  RxInt governmentid = 0.obs;
  List items = [];
  List cities = [];

  changecity(String store, int id) {
    city.value = store;
    cityid.value = id;
    print('//////controllerid//////////');
    print(cityid);
  }

  changegov(String store, int id) {
    government.value = store;
    governmentid.value = id;
    print('//////controllerid//////////');
    print(governmentid);
  }

  readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/places.json');
    final data = await json.decode(response);
    items = data["governorates"];
    cities = data['cities'];
  }

  String? getcityname(int id) {
    for (var i = 0; i < cities.length; i++) {
      if (cities[i]['id'] == id) {
        return cities[i]['namecat'.tr];
      }
    }
    return null;
  }

  String? getgovname(int id) {
    for (var i = 0; i < items.length; i++) {
      if (items[i]['id'] == id) {
        return items[i]['namecat'.tr];
      }
    }
    return null;
  }
}
