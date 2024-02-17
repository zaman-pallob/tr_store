import 'package:drift/drift.dart';
import 'package:tr_store/core/app_database/app_database.dart';
import 'package:tr_store/database/cart_products/my_cart_products.dart';

part 'my_cart_dao.g.dart';

@DriftAccessor(tables: [MyCartProducts])
class MyCartDao extends DatabaseAccessor<AppDatabase> with _$MyCartDaoMixin {
  MyCartDao(AppDatabase db) : super(db);

  Future addCartProduct(List<MyCartProductModel> products) async {
    await Future.forEach(products, (element) async {
      await _addProduct(element);
    });
  }

  Future _addProduct(MyCartProductModel productModel) async {
    var ob = await getProduct(productModel.id);
    if (ob == null) {
      await _insertProduct(productModel);
    } else {
      await _updateProduct(productModel);
    }
  }

  Future<MyCartProductModel?> getProduct(String id) =>
      (select(myCartProducts)..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();

  Future _insertProduct(MyCartProductModel productModel) =>
      into(myCartProducts).insert(productModel);

  Future _updateProduct(MyCartProductModel productModel) =>
      update(myCartProducts).replace(productModel);

  Future removeProduct(String productId) =>
      (delete(myCartProducts)..where((tbl) => tbl.id.equals(productId))).go();
}
