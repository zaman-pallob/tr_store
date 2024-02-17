import 'package:tr_store/models/product_model.dart';
import 'package:tr_store/providers/product_details/productdetails_interface.dart';
import 'package:tr_store/repository/product_repo.dart';

import '../../navigation_window.dart';

class ProductDetailsViewModel {
  late ProductDetailsInterface interface;
  ProductRepo repo = ProductRepo();
  void setInterface(ProductDetailsInterface interface) {
    this.interface = interface;
  }

  Future getProductDetails(String productId) async {
    await repo.getProductDetails(productId: productId).then((value) {
      if (value.isSuccess) {
        ProductModel model = value.object as ProductModel;
        interface.onDetailsFetched(model);
      } else {
        dao.getProduct(int.parse(productId)).then((model) {
          interface.onDetailsFetched(model);
        });
      }
    });
  }
}
