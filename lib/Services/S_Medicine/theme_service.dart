import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/main.dart';

class ThemeServices {
  final _key = 'isDarkMode';
  _saveThemeToBox(bool isDarkMode) => box.write(_key, isDarkMode);

  bool _loadThemeFromBox() => box.read(_key) ?? false;

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;
  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
