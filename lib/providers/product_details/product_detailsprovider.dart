// ignore_for_file: close_sinks

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tr_store/models/product_model.dart';
import 'package:tr_store/providers/product_details/product_details_viewmodel.dart';
import 'package:tr_store/providers/product_details/productdetails_interface.dart';

import '../../core/app_components/app_colors.dart';
import '../../core/utils/cart_product_handler.dart';
import '../../models/cart_product.dart';

class ProductDetailsProvider extends ChangeNotifier
    implements ProductDetailsInterface {
  ProductDetailsViewModel viewModel;
  String productId;
  List<String> images = [];
  String name = "", details = "", price = "", id = "", image = "";
  BehaviorSubject<bool> hasProgress = BehaviorSubject.seeded(true);

  ProductDetailsProvider(this.viewModel, this.productId) {
    viewModel.setInterface(this);
    viewModel.getProductDetails(productId);
  }

  void addProduct() {
    addProductToCart(CartProduct(id, name, price, 1, image));
    Fluttertoast.showToast(
        msg: "Product added to cart",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        textColor: AppColors.white,
        backgroundColor: AppColors.primary);
  }

  @override
  void onDetailsFetched(ProductModel? productModel) {
    name = productModel?.title ?? "";
    details = productModel?.content ?? "";
    price = productModel?.userId.toString() ?? "";
    id = productId;
    image = productModel?.image ?? "";
    for (var i = 0; i < 5; i++) {
      images.add(productModel?.image ?? "");
    }
    hasProgress.sink.add(false);
    notifyListeners();
  }

  @override
  void onFailed() {}
}
