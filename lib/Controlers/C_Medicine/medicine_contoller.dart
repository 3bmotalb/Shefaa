// ignore_for_file: unnecessary_new

import 'package:get/get.dart';

import '../../DB/DB_Medicine/db_helper.dart';
import '../../Model/M_Medicine/medicine.dart';

class MedicineContoller extends GetxController {

  var medicinelist = <Medicine>[].obs;
  var onemedicinelist = <Medicine>[].obs;

  Future<int> addmed({required Medicine medicine}) async {
    return await DBHelper.insert(medicine);
  }

  void getMedicines() async {
    List<Map<String, dynamic>> medicines = await DBHelper.query();
    medicinelist
        .assignAll(medicines.map((data) => Medicine.fromJson(data)).toList());
  }

  void delete(Medicine medicine) {
    DBHelper.delete(medicine);
    getMedicines();
  }

  void markcomplete(int id) async {
    await DBHelper.update(id);
    getMedicines();
  }

  void getMedicinedata(int id) async {
    List<Map<String, dynamic>> medicine = await DBHelper.getdata(id);
    onemedicinelist.assignAll(
        medicine.map((data) => new Medicine.fromJson(data)).toList());
  }
}
