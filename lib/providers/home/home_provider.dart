// ignore_for_file: must_call_super, close_sinks

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';

import 'package:tr_store/models/product_model.dart';
import 'package:tr_store/providers/home/home_interface.dart';
import 'package:tr_store/providers/home/home_viewmodel.dart';

import '../../core/app_components/app_colors.dart';
import '../../core/utils/cart_product_handler.dart';
import '../../models/cart_product.dart';

class HomeProvider extends ChangeNotifier implements HomeInterface {
  HomeViewModel homeViewModel;
  BehaviorSubject<bool> hasProgress = BehaviorSubject.seeded(true);
  List<ProductModel> products = [];
  HomeProvider(this.homeViewModel) {
    homeViewModel.setInterface(this);
  }

  void addProduct(int index) {
    addProductToCart(CartProduct(
        products[index].id.toString(),
        products[index].title ?? "",
        products[index].userId.toString(),
        1,
        products[index].image ?? ""));
    Fluttertoast.showToast(
        msg: "Product added to cart",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        textColor: AppColors.white,
        backgroundColor: AppColors.primary);
  }

  @override
  void onProductsFetched(List<ProductModel> products) {
    this.products = products;
    hasProgress.sink.add(false);
    notifyListeners();
  }

  @override
  void onFailed() {}

  @override
  void dispose() {}
}
