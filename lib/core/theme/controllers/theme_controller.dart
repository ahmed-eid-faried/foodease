import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:foodease/core/utill/app_constants.dart';
import 'package:foodease/core/utill/color_resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController with ChangeNotifier {
  final SharedPreferences? sharedPreferences;
  ThemeController({required this.sharedPreferences}) {
    _loadCurrentTheme();
  }

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;
  Color? get white =>
      darkTheme ? ColorResources.white : const Color(0xFFDA6317);
  Color? get black => darkTheme ? null : ColorResources.black;

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    sharedPreferences!.setBool(AppConstants.theme, _darkTheme);
    notifyListeners();
  }

  void _loadCurrentTheme() async {
    _darkTheme = sharedPreferences!.getBool(AppConstants.theme) ?? false;
    notifyListeners();
  }
}
