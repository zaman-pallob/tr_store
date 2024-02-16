// ignore_for_file: unused_local_variable

import 'package:tr_store/models/product_model.dart';
import 'package:tr_store/providers/home/home_interface.dart';
import 'package:tr_store/repository/product_repo.dart';

class HomeViewModel {
  late HomeInterface interface;
  ProductRepo repo = ProductRepo();
  void setInterface(HomeInterface interface) {
    this.interface = interface;
    getProducts();
  }

  Future getProducts() async {
    await repo.getProducts().then((value) {
      if (value.isSuccess) {
        List<ProductModel> products = value.object as List<ProductModel>;
      } else {}
    });
  }

  Future getDetails(String productId) async {
    await repo.getProductDetails(productId: productId).then((value) {
      if (value.isSuccess) {
        List<ProductModel> products = value.object as List<ProductModel>;
      } else {}
    });
  }
}
