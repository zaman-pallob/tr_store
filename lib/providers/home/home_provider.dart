import 'package:flutter/material.dart';
import 'package:tr_store/providers/home/home_interface.dart';
import 'package:tr_store/providers/home/home_viewmodel.dart';

class HomeProvider extends ChangeNotifier implements HomeInterface {
  HomeViewModel homeViewModel;
  HomeProvider(this.homeViewModel) {
    homeViewModel.setHomeViewModel(this);
  }
}
