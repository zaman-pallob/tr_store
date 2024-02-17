// ignore_for_file: unused_local_variable

import 'package:tr_store/models/product_model.dart';
import 'package:tr_store/providers/home/home_interface.dart';
import 'package:tr_store/repository/product_repo.dart';

import '../../navigation_window.dart';

class HomeViewModel {
  late HomeInterface interface;

  ProductRepo repo = ProductRepo();
  void setInterface(HomeInterface interface) {
    this.interface = interface;
    getProducts();
  }

  Future getProducts() async {
    await repo.getProducts().then((value) async {
      if (value.isSuccess) {
        List<ProductModel> productList = value.object as List<ProductModel>;
        interface.onProductsFetched(productList);
        Future.delayed(Duration(seconds: 2), () {
          manageProduct(productList);
        });
      } else {
        dao.getAllProducts().then((products) {
          interface.onProductsFetched(products);
        });
      }
    });
  }

  Future manageProduct(List<ProductModel> products) async {
    dao.removeAllProducts();
    dao.addProduct(products);
  }
}
