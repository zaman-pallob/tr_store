import '../../models/cart_product.dart';

abstract class CartInterface {
  void onFetchCartItems(List<CartProduct> cartProducts);
  void onFailed();
}
