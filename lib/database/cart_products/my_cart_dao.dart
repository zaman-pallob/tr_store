import 'package:drift/drift.dart';
import 'package:tr_store/core/app_database/app_database.dart';
import 'package:tr_store/database/cart_products/my_cart_products.dart';

import '../../models/cart_product.dart';

part 'my_cart_dao.g.dart';

@DriftAccessor(tables: [MyCartProducts])
class MyCartDao extends DatabaseAccessor<AppDatabase> with _$MyCartDaoMixin {
  MyCartDao(AppDatabase db) : super(db);

  Future addCartProduct(List<CartProduct> products) async {
    await Future.forEach(products, (element) async {
      await _addProduct(MyCartProductModel(
          id: element.id,
          name: element.name,
          price: element.price,
          image: element.image,
          quantity: element.quantity));
    });
  }

  Future<List<CartProduct>> getAllCartProducts() async {
    var ob = await select(myCartProducts).get();
    List<CartProduct> products = [];
    ob.forEach((element) {
      products.add(CartProduct(
        element.id,
        element.name,
        element.price,
        element.quantity,
        element.image,
      ));
    });
    return products;
  }

  Future _addProduct(MyCartProductModel productModel) async {
    var ob = await _getProduct(productModel.id);
    if (ob == null) {
      await _insertProduct(productModel);
    } else {
      await _updateProduct(productModel);
    }
  }

  Future<MyCartProductModel?> _getProduct(String id) =>
      (select(myCartProducts)..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();

  Future _insertProduct(MyCartProductModel productModel) =>
      into(myCartProducts).insert(productModel);

  Future _updateProduct(MyCartProductModel productModel) async {
    await customUpdate(
        "UPDATE my_cart_products SET quantity= ${productModel.quantity} WHERE id = '${productModel.id}' ;");
  }

  Future removeProduct(String productId) =>
      (delete(myCartProducts)..where((tbl) => tbl.id.equals(productId))).go();
}
