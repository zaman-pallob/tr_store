import 'package:tr_store/models/product_model.dart';

abstract class HomeInterface {
  void onProductsFetched(List<ProductModel> products);
  void onFailed();
}
