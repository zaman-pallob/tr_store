// ignore_for_file: must_call_super

import 'package:flutter/material.dart';
import 'package:tr_store/models/product_model.dart';
import 'package:tr_store/providers/home/home_interface.dart';
import 'package:tr_store/providers/home/home_viewmodel.dart';

class HomeProvider extends ChangeNotifier implements HomeInterface {
  HomeViewModel homeViewModel;

  List<ProductModel> products = [];
  HomeProvider(this.homeViewModel) {
    homeViewModel.setInterface(this);
  }

  @override
  void onProductsFetched(List<ProductModel> products) {
    this.products = products;
    notifyListeners();
  }

  @override
  void onFailed() {}

  @override
  void dispose() {}
}
