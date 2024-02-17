import 'package:tr_store/models/product_model.dart';

abstract class ProductDetailsInterface {
  void onDetailsFetched(ProductModel? productModel);
  void onFailed();
}
