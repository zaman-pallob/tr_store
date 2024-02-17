import 'package:drift/drift.dart';
import 'package:tr_store/core/app_database/app_database.dart';
import 'package:tr_store/database/fetched_products/fetch_products.dart';
import 'package:tr_store/models/product_model.dart';

part 'fetch_products_dao.g.dart';

@DriftAccessor(tables: [FetchProducts])
class FetchProductsDao extends DatabaseAccessor<AppDatabase>
    with _$FetchProductsDaoMixin {
  FetchProductsDao(AppDatabase db) : super(db);

  Future addProduct(List<ProductModel> products) async {
    await Future.forEach(products, (element) async {
      await _insertProduct(FetchProductsModel(
        id: element.id,
        title: element.title,
        price: element.userId.toString(),
        image: element.image,
        content: element.content,
      ));
    });
  }

  Future<List<ProductModel>> getAllProducts() async {
    var ob = await select(fetchProducts).get();
    List<ProductModel> products = [];
    ob.forEach((element) {
      products.add(ProductModel(
        id: element.id,
        title: element.title,
        content: element.content,
        userId: int.parse(element.price.toString()),
        image: element.image,
      ));
    });
    return products;
  }

  Future<ProductModel> getProduct(int productId) async {
    var ob = await (select(fetchProducts)
          ..where((tbl) => tbl.id.equals(productId)))
        .getSingle();

    return ProductModel(
      id: productId,
      userId: int.parse(ob.price ?? "-1"),
      title: ob.title,
      content: ob.content,
      image: ob.image,
    );
  }

  Future _insertProduct(FetchProductsModel model) =>
      into(fetchProducts).insert(model);

  Future removeAllProducts() => (delete(fetchProducts)).go();
}
