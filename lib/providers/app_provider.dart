import 'package:flutter/material.dart';
import 'package:tr_store/core/app_components/app_string.dart';

class AppProvider extends ChangeNotifier {
  int currentOption = 0;
  String currentTitle = AppString.product;
  setCurrentOption(int index, String title) {
    this.currentOption = index;
    this.currentTitle = title;
    notifyListeners();
  }

  setCurrentTitle(String title) {
    this.currentTitle = title;
    notifyListeners();
  }
}
