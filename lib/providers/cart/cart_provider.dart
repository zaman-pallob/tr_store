// ignore_for_file: close_sinks

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tr_store/models/cart_product.dart';
import 'package:tr_store/providers/cart/cart_interface.dart';
import 'package:tr_store/providers/cart/cart_viewmodel.dart';

class CartProvider extends ChangeNotifier implements CartInterface {
  CartViewmodel viewmodel;
  List<CartProduct> cartProducts = [];
  BehaviorSubject<bool> hasProgress = BehaviorSubject.seeded(true);
  CartProvider(this.viewmodel) {
    viewmodel.setInterface(this);
  }

  void removeItem(String productId) {
    viewmodel.removeProduct(productId);
  }

  @override
  void onFetchCartItems(List<CartProduct> cartProducts) {
    this.cartProducts = cartProducts;
    hasProgress.sink.add(false);
    notifyListeners();
  }

  @override
  void onFailed() {}
}
