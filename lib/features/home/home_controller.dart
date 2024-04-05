import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    notifyListeners();
  }

  @override
  // ignore: unnecessary_overrides
  void dispose() {
    super.dispose();
  }

  String type = "";

  void viewMoreChange(String value) {
    if (type == value) {
      type = "";
    } else {
      type = value;
    }

    print("viewMoreChange:-${type == value}");
    notifyListeners();
  }

  bool viewMore(String title) {
    print("viewMore:-${type == title}");
    return (title == type);
  }

  bool viewMoreValue(String title) {
    print("viewMore:-${type == title}");
    return (title == type || "" == type);
  }

  // bool filterState = true;
  List<String> filters = [];
  List<String> filtersReslut = ["Restaurant", '>10 Km', 'Soup'];
  List<String> types = ["Restaurant", "Menu"];
  List<String> locations = ['1 Km', '>10 Km', '<10 Km'];
  List<String> foods = [
    'Cake',
    'Soup',
    'Main Course',
    'Appetizer',
    'Dessert',
  ];
}
