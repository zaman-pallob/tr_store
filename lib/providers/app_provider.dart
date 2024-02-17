import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  int currentOption = 0;
  String currentTitle = "";
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
