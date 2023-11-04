import 'package:sqflite/sqflite.dart';

import '../../Model/M_Medicine/medicine.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tablename = "medicines";

  static Future<void> initDb() async {
    if (_db != null) return;

    try {
      String _path = await getDatabasesPath() + 'medicines.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          
          return db.execute("CREATE TABLE $_tablename("
              "id INTEGER PRIMARY KEY AUTOINCREMENT, "
              "name STRING,date STRING,"
              "starttime STRING,interval INTEGER,"
              "repet STRING,image INTEGER,"
              "iscompleted INTEGER)");
        },
      );
    // ignore: empty_catches
    } catch (e) {
      
    }
  }

  static Future<int> insert(Medicine? medicine) async {
    
    return await _db?.insert(_tablename, medicine!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    
    return await _db!.query(_tablename);
  }

  static delete(Medicine medicine) async {
    return await _db!
        .delete(_tablename, where: 'id=?', whereArgs: [medicine.id]);
  }

  static update(int id) async {
    return await _db!.rawUpdate(
        'UPDATE medicines SET iscompleted = ? WHERE id = ?', [1, id]);
  }

  static Future<List<Map<String, dynamic>>> getdata(int id) async {
    // get a reference to the database

    // raw query
    return await _db!.rawQuery('SELECT * FROM medicines WHERE id=?', [id]);

    // print the results
  }
}
