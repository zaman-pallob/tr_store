import 'package:tr_store/providers/product_details/productdetails_interface.dart';

class ProductDetailsViewModel {
  late ProductDetailsInterface interface;
  void setInterface(ProductDetailsInterface interface) {
    this.interface = interface;
  }
}
