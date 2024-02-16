import 'package:flutter/material.dart';
import 'package:tr_store/providers/product_details/product_details_viewmodel.dart';
import 'package:tr_store/providers/product_details/productdetails_interface.dart';

class ProductDetailsProvider extends ChangeNotifier
    implements ProductDetailsInterface {
  ProductDetailsViewModel viewModel;

  ProductDetailsProvider(this.viewModel) {
    viewModel.setInterface(this);
  }
}
