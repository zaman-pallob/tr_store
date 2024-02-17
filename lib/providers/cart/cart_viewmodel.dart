import 'package:tr_store/core/utils/cart_product_handler.dart';
import 'package:tr_store/core/utils/global_variable.dart';
import 'package:tr_store/models/cart_product.dart';
import 'package:tr_store/providers/cart/cart_interface.dart';

class CartViewmodel {
  late CartInterface interface;
  void setInterface(CartInterface interface) {
    this.interface = interface;
    loadProduct();
  }

  void removeProduct(String id) {
    removeProductFromCart(id);
    List<CartProduct> list = GlobalVariable.cartStream.value;
    interface.onFetchCartItems(list);
  }

  void loadProduct() {
    List<CartProduct> list = GlobalVariable.cartStream.value;
    interface.onFetchCartItems(list);
  }
}
