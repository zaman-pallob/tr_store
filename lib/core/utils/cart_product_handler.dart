import 'package:tr_store/core/utils/global_variable.dart';

import '../../models/cart_product.dart';

int getTotalItems(List<CartProduct> products) {
  int counter = 0;
  products.forEach((element) {
    counter = counter + element.quantity;
  });

  return counter;
}

void addProductToCart(CartProduct cartProduct) {
  bool wasAdded = false;
  List<CartProduct> list = GlobalVariable.cartStream.value;
  list.forEach((element) {
    if (element.id == cartProduct.id) {
      element.quantity++;
      wasAdded = true;
    }
  });
  if (!wasAdded) {
    list.add(cartProduct);
  }

  GlobalVariable.cartStream.sink.add(list);
}

void removeProductFromCart(String id) {
  List<CartProduct> list = GlobalVariable.cartStream.value;
  list.removeWhere((element) => element.id == id);
  GlobalVariable.cartStream.sink.add(list);
}
