import 'package:flutter/material.dart';
import 'package:tr_store/providers/cart/cart_interface.dart';
import 'package:tr_store/providers/cart/cart_viewmodel.dart';

class CartProvider extends ChangeNotifier implements CartInterface {
  CartViewmodel viewmodel;
  int totalItems = 0;
  CartProvider(this.viewmodel) {
    viewmodel.setInterface(this);
  }
}
