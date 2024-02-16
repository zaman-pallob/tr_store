import 'package:tr_store/providers/cart/cart_interface.dart';

class CartViewmodel {
  late CartInterface interface;
  void setInterface(CartInterface interface) {
    this.interface = interface;
  }
}
