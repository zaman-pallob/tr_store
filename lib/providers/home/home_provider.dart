import 'package:flutter/material.dart';
import 'package:tr_store/providers/home/home_interface.dart';
import 'package:tr_store/providers/home/home_viewmodel.dart';

class HomeProvider extends ChangeNotifier implements HomeInterface {
  HomeProvider(HomeViewModel homeViewModel) {
    homeViewModel.setInterface(this);
  }

  @override
  void onFailed() {}
}
